import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class RemoteServices extends GetConnect {
  var storage = GetStorage();
  static var client = http.Client();
  //late final autenticarUrl =
  //storage.read(("URL_BASE") + ('/index.php/REST_login/autenticar'));
  late final getBoletosClienteUrl = storage
      .read(("URL_BASE") + ('/index.php/REST_clientes/get_boletos_de_cliente'));

  Future<DatosSesionModel?> fetchLogin(UsuarioModel model) async {
    final autenticarUrl =
        await storage.read(("URL_BASE") + ('/index.php/REST_login/autenticar'));
    final response = await post(autenticarUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return DatosSesionModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Aviso>> getAvisos() async {
    var response = await client.post(
      Uri.parse(getBoletosClienteUrl),
      body: ({
        'TOKEN': storage.read('TOKEN'),
        'ID_CLIENTE': storage.read('ID_CLIENTE'),
      }),
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return avisosFromJson(jsonString);
    } else {
      throw Get.snackbar("Error ${response.statusCode}",
          "Respuesta del servidor: ${response.reasonPhrase.toString()}");
    }
  }
}
