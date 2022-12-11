import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/controllers/controllers.dart';

import '../models/models.dart';
import '../services/avisos_service.dart';
import '../views/pages/pages.dart';

class InmuebleEditarController extends GetxController {
  //TODO Cambiar URL Base
  final urlBase = "http://10.0.2.2:8080";
  final urlHrefTipoUnidadBase = "/restful/objects/inmobiliaria.TipoUnidad/";
  final urlHrefLocalidadBase = "/restful/objects/simple.localidad/";
  final urlHrefClienteBase = "/restful/objects/simple.cliente/";
  TextEditingController descripcionController = TextEditingController();
  TextEditingController fechaExclusividadController = TextEditingController();
  TextEditingController calleController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController edificacionController = TextEditingController();
  TextEditingController pisoController = TextEditingController();
  TextEditingController departamentoController = TextEditingController();
  TextEditingController latitudController = TextEditingController();
  TextEditingController longitudController = TextEditingController();
  TextEditingController localidadController = TextEditingController();
  TextEditingController tipoUnidadController = TextEditingController();
  TextEditingController clienteController = TextEditingController();

  final AvisosServices _remoteServices = Get.put(AvisosServices());
  final HomeController _homeController = Get.put(HomeController());
  var inmueble = EditarInmueble(
    altura: Altura(value: ""),
    calle: Calle(value: ""),
    departamento: Departamento(value: ""),
    descripcion: Descripcion(value: ""),
    edificacion: Edificacion(value: ""),
    fechaExclusividad: FechaExclusividad(value: ""),
    latitud: Latitud(value: ""),
    longitud: Longitud(value: ""),
    piso: Piso(value: ""),
    cliente: ClienteEditar(
        value: InmuebleValue(
      rel: "urn:org.restfulobjects:rels/value",
      href: "",
      method: "GET",
      type:
          "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
      title: "",
    )),
    tipoUnidad: TipoUnidadEditar(
        value: InmuebleValue(
      rel: "urn:org.restfulobjects:rels/value",
      href: "",
      method: "GET",
      type:
          "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
      title: "",
    )),
    localidad: LocalidadEditar(
        value: InmuebleValue(
      rel: "urn:org.restfulobjects:rels/value",
      href: "",
      method: "GET",
      type:
          "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
      title: "",
    )),
  ).obs;

  var isLoading = true.obs;

  void editarInmueble(/*hrefInmueble*/) async {
    try {
      isLoading(true);
      var response = await _remoteServices
          .editInmuebleBase(inmueble.value /*, hrefInmueble*/);
      inmueble.value = response;
    } finally {
      isLoading(false);
      _homeController.onInit();
      Get.to(() => HomePage());
    }
  }
}
