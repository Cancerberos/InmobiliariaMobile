import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/models.dart';

class AvisosServices extends GetConnect {
  var storage = GetStorage();
  //final urlBase = "http://webinmobiliaria.us-east-1.elasticbeanstalk.com";
  final urlBase = "http://10.0.2.2:8080";
  //final urlBase = "http://localhost:8080";
  static var client = http.Client();
  var headers = {
    'authorization': 'Basic ${base64Encode(utf8.encode('sven:pass'))}',
    "Accept": "application/json;profile=urn:org.apache.isis/v2;suppress=all"
  };

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

  Future<InmuebleCaracteristica> getInmuebleCaracteristica(String? href) async {
    final getInmuebleUrl = ('$urlBase$href');

    var response =
        await client.get(Uri.parse(getInmuebleUrl), headers: headers);

    if (response.statusCode == 200) {
      final responseInmuebleCaracteristicas = response.body;
      return inmuebleCaracteristicaFromJson(responseInmuebleCaracteristicas);
    } else {
      throw Exception('Failed to load ...');
    }
  }

  Future<TipoCaracteristica> getTipoCaracteristica(String? href) async {
    var response = await client.get(Uri.parse(href!), headers: headers);

    if (response.statusCode == 200) {
      final responseTipoCaracteristica = response.body;
      return tipoCaracteristicaFromJson(responseTipoCaracteristica);
    } else {
      throw Exception('Failed to load ...');
    }
  }

  Future<AvisoContacto> addAvisoContacto(AvisoContacto avisoContacto) async {
    const urlMethod =
        "/restful/services/simple.AvisoContactoAdd/actions/AddAvisoContacto/invoke";
    final putAvisoContactoUrl = ('$urlBase$urlMethod');
    //final response =
    await http.put(
      Uri.parse(putAvisoContactoUrl),
      headers: headers,
      body: json.encode(avisoContacto),
    );

    //TODO error 404
    //String responseAvisoContacto = response.body;
    return avisoContacto;
  }

  Future<List<Inmueble>> getInmuebles() async {
    final getAvisosUrl =
        ('$urlBase/restful/services/simple.InmuebleRepositorio/actions/listAll/invoke');

    var response = await client.post(Uri.parse(getAvisosUrl),
        headers: headers, body: "{}");

    if (response.statusCode == 200) {
      final responseAvisos = response.body;
      return inmueblesFromJson(responseAvisos);
    } else {
      throw Exception('Failed to load ...');
    }
  }

  Future<EditarInmueble> editInmuebleBase(
      EditarInmueble inmueble /*, String hrefInmueble*/) async {
    const urlMethod =
        "/restful/objects/simple.inmueble/4/actions/UpdateDatosProncipales/invoke";
    final editInmuebleBaseUrl = ('$urlBase$urlMethod');
    final response = await http.put(
      Uri.parse(editInmuebleBaseUrl),
      headers: headers,
      body: json.encode(inmueble),
    );

    if (response.statusCode == 200) {
      //final responseEditInmuebleBase = response.body;
      //return editarInmuebleFromJson(responseEditInmuebleBase);
      return inmueble;
    } else {
      throw Exception('Failed to load ...');
    }
  }
}
