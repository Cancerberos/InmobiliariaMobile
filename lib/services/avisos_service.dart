import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/models.dart';

class AvisosServices extends GetConnect {
  var storage = GetStorage();
  final urlBase = "http://10.0.2.2:8080";
  //final urlBase = "http://localhost:8080";
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
      final responseAvisos = response.body;
      return avisoFromJson(responseAvisos);
    } else {
      throw Exception('Failed to load ...');
    }
  }

  Future<Inmueble> getInmueble(String? href) async {
    final urlMethod = href?.substring((href.indexOf("restful")) - 1);
    final getInmuebleUrl = ('$urlBase$urlMethod');

    var response =
        await client.get(Uri.parse(getInmuebleUrl), headers: headers);

    if (response.statusCode == 200) {
      final responseInmueble = response.body;
      return inmuebleFromJson(responseInmueble);
    } else {
      throw Exception('Failed to load ...');
    }
  }

  Future<List<Imagen>> getImagenes(String? href) async {
    final urlMethod = href?.substring((href.indexOf("restful")) - 1);
    final getInmuebleUrl = ('$urlBase$urlMethod');

    var response =
        await client.get(Uri.parse(getInmuebleUrl), headers: headers);

    if (response.statusCode == 200) {
      final responseImagen = response.body;
      return imagenesFromJson(responseImagen);
    } else {
      throw Exception('Failed to load ...');
    }
  }

  // Future<AvisoContacto> addAvisoContacto(AvisoContacto avisoContacto) async {
  //   const urlMethod =
  //       "/services/simple.AvisoContactoAdd/actions/AddAvisoContacto/invoke";
  //   final putAvisoContactoUrl = ('$urlBase$urlMethod');
  //   final response = await http.put(
  //     Uri.parse(putAvisoContactoUrl),
  //     headers: headers,
  //     body: {
  //       avisoContacto.toJson(),
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     String responseAvisoContacto = response.body;
  //     return avisoContactoFromJson(responseAvisoContacto);
  //   } else {
  //     throw Exception('Failed to load info');
  //   }
  // }

  Future<AvisoContacto> addAvisoContacto(AvisoContacto avisoContacto) async {
    const urlMethod =
        "/restful/services/simple.AvisoContactoAdd/actions/AddAvisoContacto/invoke";
    final putAvisoContactoUrl = ('$urlBase$urlMethod');
    final response = await http.put(
      Uri.parse(putAvisoContactoUrl),
      headers: headers,
      body: json.encode(avisoContacto),
    );

    //TODO error 404
    //String responseAvisoContacto = response.body;
    return avisoContacto;
  }
}
