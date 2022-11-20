import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static final client = http.Client();
  static final storage = GetStorage();

  // static void post(var body, String endpoint) async {
  //   var response = await client.post(buildUrl(endpoint), body: body);
  // }

  static Uri buildUrl(String endpoint) {
    String host = storage.read("urlBase");
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static void storeToken(String token) async {
    await storage.write("token", token);
  }

  static Future<String> getToken(String token) async {
    return await storage.read(token);
  }
}
