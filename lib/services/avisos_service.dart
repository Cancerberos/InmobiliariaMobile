import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class AvisosServices extends GetConnect {
  var storage = GetStorage();
  final urlBase = "http://10.0.2.2:8080";
  static var client = http.Client();
  var headers = {
    'authorization': 'Basic ${base64Encode(utf8.encode('sven:pass'))}',
    "Accept": "application/json;profile=urn:org.apache.isis/v2;suppress=all"
  };

  // var headers = {
  //   'Accept': 'application/json;profile=urn:org.apache.isis/v2;suppress=all',
  //   'Authorization': 'Basic c3ZlbjpwYXNz'
  // };

  // Future<UsuarioModel?> getUserValidation(
  //   TextEditingController usernameController,
  //   TextEditingController passwordController,
  // ) async {
  //   // final getUsuarioUrl =
  //   //     ('$urlBase/restful/services/simple.UsuarioRepositorio/actions/userValidation/invoke?username=${usernameController.text}&password=${passwordController.text}');
  //   final getUsuarioUrl =
  //       ('$urlBase/restful/services/simple.UsuarioRepositorio/actions/userValidation/invoke?username=Admin&password=fantasma');

  //   final response =
  //       await client.get(Uri.parse(getUsuarioUrl), headers: headers);

  //   if (response.statusCode == HttpStatus.ok) {
  //     return usuarioFromJson(response.body);
  //   } else {
  //     return throw Exception('Failed to load ...');
  //   }
  // }

  Future<List<Aviso>> getAvisos() async {
    final getAvisosUrl =
        ('$urlBase/restful/services/simple.AvisoRepositorio/actions/listarAvisos/invoke');

    var response = await client.get(Uri.parse(getAvisosUrl), headers: headers);

    if (response.statusCode == 200) {
      final jsonString = response.body;
      return avisoFromJson(jsonString);
    } else {
      throw Exception('Failed to load ...');
    }
  }
}
