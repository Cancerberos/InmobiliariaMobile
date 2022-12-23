import 'package:get/get.dart';

import '../models/models.dart';
import '../services/avisos_service.dart';

class HomeController extends GetxController {
  List<Inmueble> inmueblesList = <Inmueble>[].obs;
  var index = 0.obs;
  var isLoading = true.obs;
  final AvisosServices _remoteServices = Get.put(AvisosServices());

  @override
  void onInit() {
    fetchInmuebles();
    super.onInit();
  }

  void fetchInmuebles() async {
    try {
      isLoading(true);
      var inmuebles = await _remoteServices.getInmuebles();
      inmueblesList = inmuebles;
    } finally {
      isLoading(false);
      fetchImagenesInmueble();
    }
  }

  void fetchImagenesInmueble() async {
    try {
      for (var inmueble in inmueblesList) {
        inmueble.imagen =
            await _remoteServices.getImagenes(inmueble.inmuebleid!);
        if (inmueble.imagen != null) {
          for (var imagen in inmueble.imagen!) {
            imagen.imagenDetalle = imagenDelleFromJson(imagen.url);
          }
        }
      }
    } finally {
      fetchInmuebleCaracteristica();
    }
  }

  void fetchInmuebleCaracteristica() async {
    try {
      for (var inmueble in inmueblesList) {
        if (inmueble.inmueble != null) {
          for (var inmuebleCaracteristica in inmueble.inmueble!) {
            inmuebleCaracteristica =
                await _remoteServices.getInmuebleCaracteristica(
                    '/restful/objects/${inmuebleCaracteristica.logicalTypeName}/${inmuebleCaracteristica.objectIdentifier}');
            inmuebleCaracteristica.tipoCaracteristica =
                await _remoteServices.getTipoCaracteristica(
                    inmuebleCaracteristica.tipoCaracteristica?.href);
          }
        }
      }
    } finally {}
  }
}
