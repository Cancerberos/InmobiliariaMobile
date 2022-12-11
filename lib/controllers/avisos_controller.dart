import 'package:get/get.dart';
import 'package:inmobiliaria/controllers/controllers.dart';

import '../models/models.dart';
import '../services/avisos_service.dart';

class AvisosController extends GetxController {
  List<Aviso> avisosList = <Aviso>[].obs;
  var avisosList2 = [].obs;
  var index = 0.obs;
  var isLoading = true.obs;
  final AvisosServices _remoteServices = Get.put(AvisosServices());
  final HomeController _homeController = Get.put(HomeController());

  @override
  void onInit() {
    fetchAvisos();
    //generarListaAvisos();
    super.onInit();
  }

  void fetchAvisos() async {
    try {
      isLoading(true);
      var avisos = await _remoteServices.getAvisos();
      avisosList = avisos;
    } finally {
      fetchInmuebleAviso();
    }
  }

  void fetchInmuebleAviso() async {
    try {
      for (var aviso in avisosList) {
        aviso.inmueble =
            await _remoteServices.getInmueble(aviso.inmueble?.href);
      }
    } finally {
      fetchImagenesInmueble();
    }
  }

  void fetchImagenesInmueble() async {
    try {
      for (var aviso in avisosList) {
        for (var imagen in aviso.inmueble!.imagen!) {
          imagen.imagenDetalle = imagenDelleFromJson(imagen.url);
        }
      }
    } finally {
      isLoading(false);
      fetchInmuebleCaracteristica();
    }
  }

  void fetchInmuebleCaracteristica() async {
    try {
      for (var aviso in avisosList) {
        for (var inmuebleCaracteristica in aviso.inmueble!.inmueble!) {
          inmuebleCaracteristica = await _remoteServices.getInmuebleCaracteristica(
              '/restful/objects/${inmuebleCaracteristica.logicalTypeName}/${inmuebleCaracteristica.objectIdentifier}');
          inmuebleCaracteristica.tipoCaracteristica =
              await _remoteServices.getTipoCaracteristica(
                  inmuebleCaracteristica.tipoCaracteristica?.href);
        }
      }
    } finally {
      _homeController.onInit();
    }
  }

  void fetchTipoCaracteristica() async {
    try {
      for (var aviso in avisosList) {
        for (var inmuebleCaracteristica in aviso.inmueble!.inmueble!) {
          inmuebleCaracteristica.tipoCaracteristica =
              await _remoteServices.getTipoCaracteristica(
                  inmuebleCaracteristica.tipoCaracteristica?.href);
        }
      }
    } finally {}
  }

  //MOCK DATA

  void generarListaAvisos() async {
    try {
      isLoading(true);

      var imagenLote = ImagenMock(
        id: "1",
        descripcion: "lote1.jpg",
        inmuebleId: "3",
        name: "lote1.jpg",
        mimetype: "image/jpg",
        bytes:
            "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",
      );

      var imagenCasa = ImagenMock(
        id: "1",
        descripcion: "casa1.jpg",
        inmuebleId: "3",
        name: "casa1.jpg",
        mimetype: "image/jpg",
        bytes:
            "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",
      );

      var imagenDepartamento = ImagenMock(
        id: "1",
        descripcion: "departamento1.jpg",
        inmuebleId: "3",
        name: "departamento1.jpg",
        mimetype: "image/jpg",
        bytes:
            "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",
      );

      var aviso1 = AvisoMock(
          id: "1",
          descripcion: "Casa en Venta 1",
          inmueble: InmuebleMock(
            id: "1",
            cliente: ClienteMock(
                id: "1",
                direccion: DireccionMock(
                  id: "1",
                  localidad: LocalidadMock(
                      id: "1",
                      provincia: ProvinciaMock(
                        id: "1",
                        descripcion: "Neuquén",
                      ),
                      descripcion: "Plottier",
                      codigoPostal: "8400"),
                  numero: "1020",
                  edificacion: "Casa",
                  piso: "1",
                  departamento: "1",
                  latitud: "-38.958689",
                  longitud: "68.138035",
                ),
                nombre: "Darío",
                apellido: "Torres",
                email: "dario@torres.com",
                telefono: "2991231239"),
            descripcion: "Inmueble Casa 1",
            fechaExclusividad: "2022-10-30",
            tipoUnidad: "Casa",
            direccion: DireccionMock(
              id: "1",
              localidad: LocalidadMock(
                  id: "1",
                  provincia: ProvinciaMock(
                    id: "1",
                    descripcion: "Neuquén",
                  ),
                  descripcion: "Plottier",
                  codigoPostal: "8400"),
              numero: "1020",
              edificacion: "Casa",
              piso: "1",
              departamento: "1",
              latitud: "-38.958364193620675",
              longitud: "-68.1378100277331",
            ),
            imagen: [
              imagenCasa,
            ],
          ),
          valor: "1.000.000,0",
          tipoOperacion: ProvinciaMock(
            id: "1",
            descripcion: "Venta",
          ),
          fechaInicio: "2022-10-2",
          fechaFin: "2022-11-30",
          estadoAviso: EstadoAvisoMock(
            id: "1",
            descripcion: "Activo",
          ));

      var aviso2 = AvisoMock(
          id: "1",
          descripcion: "Departamento en Alquiler 1",
          inmueble: InmuebleMock(
            id: "1",
            cliente: ClienteMock(
                id: "1",
                direccion: DireccionMock(
                  id: "1",
                  localidad: LocalidadMock(
                      id: "1",
                      provincia: ProvinciaMock(
                        id: "1",
                        descripcion: "Neuquén",
                      ),
                      descripcion: "Plottier",
                      codigoPostal: "8400"),
                  numero: "1020",
                  edificacion: "Edificio",
                  piso: "1",
                  departamento: "1",
                  latitud: "-38.958364193620675",
                  longitud: "-68.1378100277331",
                ),
                nombre: "Nicolás",
                apellido: "Fuentes",
                email: "nicolas@fuentes.com",
                telefono: "2991231239"),
            descripcion: "Inmueble Departamento 1",
            fechaExclusividad: "2022-10-30",
            tipoUnidad: "Departamento",
            direccion: DireccionMock(
              id: "1",
              localidad: LocalidadMock(
                  id: "1",
                  provincia: ProvinciaMock(
                    id: "1",
                    descripcion: "Neuquén",
                  ),
                  descripcion: "Centenario",
                  codigoPostal: "8400"),
              numero: "1020",
              edificacion: "Edificio",
              piso: "1",
              departamento: "1",
              latitud: "-38.958364193620675",
              longitud: "-68.1378100277331",
            ),
            imagen: [
              imagenDepartamento,
            ],
          ),
          valor: "1.000.000,0",
          tipoOperacion: ProvinciaMock(
            id: "1",
            descripcion: "Alquiler",
          ),
          fechaInicio: "2022-10-2",
          fechaFin: "2022-11-30",
          estadoAviso: EstadoAvisoMock(
            id: "1",
            descripcion: "Activo",
          ));

      var aviso3 = AvisoMock(
          id: "1",
          descripcion: "Lote en Venta 1",
          inmueble: InmuebleMock(
            id: "1",
            cliente: ClienteMock(
                id: "1",
                direccion: DireccionMock(
                  id: "1",
                  localidad: LocalidadMock(
                      id: "1",
                      provincia: ProvinciaMock(
                        id: "1",
                        descripcion: "Neuquén",
                      ),
                      descripcion: "Neuquén",
                      codigoPostal: "8300"),
                  numero: "1020",
                  edificacion: "Loteo",
                  piso: "1",
                  departamento: "1",
                  latitud: "-38.958364193620675",
                  longitud: "-68.1378100277331",
                ),
                nombre: "Manuel",
                apellido: "Castillo",
                email: "manuel@castillo.com",
                telefono: "2991231239"),
            descripcion: "Inmueble Lote 1",
            fechaExclusividad: "2022-10-30",
            tipoUnidad: "Lote",
            direccion: DireccionMock(
              id: "1",
              localidad: LocalidadMock(
                  id: "1",
                  provincia: ProvinciaMock(
                    id: "1",
                    descripcion: "Neuquén",
                  ),
                  descripcion: "Plottier",
                  codigoPostal: "8400"),
              numero: "1020",
              edificacion: "Loteo",
              piso: "1",
              departamento: "1",
              latitud: "-38.958364193620675",
              longitud: "-68.1378100277331",
            ),
            imagen: [
              imagenLote,
            ],
          ),
          valor: "1.000.000,0",
          tipoOperacion: ProvinciaMock(
            id: "1",
            descripcion: "Venta",
          ),
          fechaInicio: "2022-10-2",
          fechaFin: "2022-11-30",
          estadoAviso: EstadoAvisoMock(
            id: "1",
            descripcion: "Activo",
          ));

      var aviso4 = AvisoMock(
          id: "1",
          descripcion: "Casa en Venta 1",
          inmueble: InmuebleMock(
            id: "1",
            cliente: ClienteMock(
                id: "1",
                direccion: DireccionMock(
                  id: "1",
                  localidad: LocalidadMock(
                      id: "1",
                      provincia: ProvinciaMock(
                        id: "1",
                        descripcion: "Neuquén",
                      ),
                      descripcion: "Plottier",
                      codigoPostal: "8400"),
                  numero: "1020",
                  edificacion: "Casa",
                  piso: "1",
                  departamento: "1",
                  latitud: "-38.958364193620675",
                  longitud: "-68.1378100277331",
                ),
                nombre: "Darío",
                apellido: "Torres",
                email: "dario@torres.com",
                telefono: "2991231239"),
            descripcion: "Inmueble Casa 1",
            fechaExclusividad: "2022-10-30",
            tipoUnidad: "Casa",
            direccion: DireccionMock(
              id: "1",
              localidad: LocalidadMock(
                  id: "1",
                  provincia: ProvinciaMock(
                    id: "1",
                    descripcion: "Neuquén",
                  ),
                  descripcion: "Plottier",
                  codigoPostal: "8400"),
              numero: "1020",
              edificacion: "Casa",
              piso: "1",
              departamento: "1",
              latitud: "-38.958364193620675",
              longitud: "-68.1378100277331",
            ),
            imagen: [
              imagenCasa,
            ],
          ),
          valor: "1.000.000,0",
          tipoOperacion: ProvinciaMock(
            id: "1",
            descripcion: "Venta",
          ),
          fechaInicio: "2022-10-2",
          fechaFin: "2022-11-30",
          estadoAviso: EstadoAvisoMock(
            id: "1",
            descripcion: "Activo",
          ));

      var aviso5 = AvisoMock(
          id: "1",
          descripcion: "Departamento en Alquiler 1",
          inmueble: InmuebleMock(
            id: "1",
            cliente: ClienteMock(
                id: "1",
                direccion: DireccionMock(
                  id: "1",
                  localidad: LocalidadMock(
                      id: "1",
                      provincia: ProvinciaMock(
                        id: "1",
                        descripcion: "Neuquén",
                      ),
                      descripcion: "Plottier",
                      codigoPostal: "8400"),
                  numero: "1020",
                  edificacion: "Edificio",
                  piso: "1",
                  departamento: "1",
                  latitud: "-38.958364193620675",
                  longitud: "-68.1378100277331",
                ),
                nombre: "Nicolás",
                apellido: "Fuentes",
                email: "nicolas@fuentes.com",
                telefono: "2991231239"),
            descripcion: "Inmueble Departamento 1",
            fechaExclusividad: "2022-10-30",
            tipoUnidad: "Departamento",
            direccion: DireccionMock(
              id: "1",
              localidad: LocalidadMock(
                  id: "1",
                  provincia: ProvinciaMock(
                    id: "1",
                    descripcion: "Neuquén",
                  ),
                  descripcion: "Centenario",
                  codigoPostal: "8400"),
              numero: "1020",
              edificacion: "Edificio",
              piso: "1",
              departamento: "1",
              latitud: "-38.958364193620675",
              longitud: "-68.1378100277331",
            ),
            imagen: [
              //imagenDepartamento,
            ],
          ),
          valor: "1.000.000,0",
          tipoOperacion: ProvinciaMock(
            id: "1",
            descripcion: "Alquiler",
          ),
          fechaInicio: "2022-10-2",
          fechaFin: "2022-11-30",
          estadoAviso: EstadoAvisoMock(
            id: "1",
            descripcion: "Activo",
          ));

      var aviso6 = AvisoMock(
          id: "1",
          descripcion: "Lote en Venta 1",
          inmueble: InmuebleMock(
            id: "1",
            cliente: ClienteMock(
                id: "1",
                direccion: DireccionMock(
                  id: "1",
                  localidad: LocalidadMock(
                      id: "1",
                      provincia: ProvinciaMock(
                        id: "1",
                        descripcion: "Neuquén",
                      ),
                      descripcion: "Neuquén",
                      codigoPostal: "8300"),
                  numero: "1020",
                  edificacion: "Loteo",
                  piso: "1",
                  departamento: "1",
                  latitud: "-38.958364193620675",
                  longitud: "-68.1378100277331",
                ),
                nombre: "Manuel",
                apellido: "Castillo",
                email: "manuel@castillo.com",
                telefono: "2991231239"),
            descripcion: "Inmueble Lote 1",
            fechaExclusividad: "2022-10-30",
            tipoUnidad: "Lote",
            direccion: DireccionMock(
              id: "1",
              localidad: LocalidadMock(
                  id: "1",
                  provincia: ProvinciaMock(
                    id: "1",
                    descripcion: "Neuquén",
                  ),
                  descripcion: "Plottier",
                  codigoPostal: "8400"),
              numero: "1020",
              edificacion: "Loteo",
              piso: "1",
              departamento: "1",
              latitud: "-38.958364193620675",
              longitud: "-68.1378100277331",
            ),
            imagen: [
              imagenLote,
              imagenCasa,
              imagenDepartamento,
            ],
          ),
          valor: "1.000.000,0",
          tipoOperacion: ProvinciaMock(
            id: "1",
            descripcion: "Venta",
          ),
          fechaInicio: "2022-10-2",
          fechaFin: "2022-11-30",
          estadoAviso: EstadoAvisoMock(
            id: "1",
            descripcion: "Activo",
          ));

      List<AvisoMock> listaAvisosList2 = [
        aviso1,
        aviso2,
        aviso3,
        aviso4,
        aviso5,
        aviso6,
      ];

      avisosList2.value = listaAvisosList2;
    } finally {
      isLoading(false);
    }
  }
}
