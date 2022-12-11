import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/models/aviso_contacto_model.dart';

import '../services/avisos_service.dart';

class AvisoContactoController extends GetxController {
  final AvisosServices _remoteServices = Get.put(AvisosServices());
  //TODO Cambiar URL Base
  final urlBase = "http://10.0.2.2:8080";
  final urlHrefAviso = "/restful/objects/simple.aviso/";
  final urlType =
      "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"";
  Rx<AvisoContacto> consulta = AvisoContacto(
      nombre: Nombre(value: ""),
      apellido: Apellido(value: ""),
      email: Email(value: ""),
      mensaje: Mensaje(value: ""),
      aviso: AvisoDeConsulta(
          value: ValueContacto(
        rel: "urn:org.restfulobjects:rels/value",
        href: "",
        method: "GET",
        type: "",
        title: "",
      )),
      estadoContacto: EstadoContacto(
          value: ValueContacto(
        rel: "urn:org.restfulobjects:rels/value",
        href:
            "http://10.0.2.2:8080/restful/objects/inmobiliaria.EstadoContacto/1",
        method: "GET",
        type:
            "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
        title: "PENDIENTE",
      ))).obs;

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mensajeController = TextEditingController();

  void putAvisoConsulta() async {
    try {
      await _remoteServices.addAvisoContacto(consulta.value);
    } finally {}
  }
}
