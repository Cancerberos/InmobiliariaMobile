import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class RemoteServices extends GetConnect {
  var storage = GetStorage();
  //TODO Cambiar URL Base
  final urlBase = "http://webinmobiliaria.us-east-1.elasticbeanstalk.com";

  //final urlBase = "http://10.0.2.2:8080";
  static var client = http.Client();
  var headers = {
    'authorization': 'Basic ${base64Encode(utf8.encode('sven:pass'))}',
    "Accept": "application/json;profile=urn:org.apache.isis/v2;suppress=all"
  };

  Future<UsuarioModel?> getUserValidation(
    TextEditingController usernameController,
    TextEditingController passwordController,
  ) async {
    final getUsuarioUrl =
        ('$urlBase/restful/services/simple.UsuarioRepositorio/actions/userValidation/invoke?username=${usernameController.text}&password=${passwordController.text}');

    final response =
        await client.get(Uri.parse(getUsuarioUrl), headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      return usuarioFromJson(response.body);
    } else {
      return throw Get.snackbar('Error', 'Contactese con Inmobiliaria Del Sur',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  Future<List<AvisoMock>> getAvisos() async {
    var response = await client.post(
      Uri.parse(urlBase),
      body: ({
        'TOKEN': storage.read('TOKEN'),
        'ID_CLIENTE': storage.read('ID_CLIENTE'),
      }),
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return avisosMockFromJson(jsonString);
    } else {
      throw Get.snackbar("Error ${response.statusCode}",
          "Respuesta del servidor: ${response.reasonPhrase.toString()}");
    }
  }
}
