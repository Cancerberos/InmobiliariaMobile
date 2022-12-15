import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/models.dart';
import '../services/remote_service.dart';
import '../views/pages/pages.dart';

class LoginController extends GetxController {
  var storage = GetStorage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RemoteServices remoteServices = Get.put(RemoteServices());
  var isPasswordHidden = true.obs;
  var usuario = UsuarioModel().obs;
  var isLoading = true.obs;

  void getUserValidation() async {
    try {
      var response = await remoteServices.getUserValidation(
          usernameController, passwordController);
      usuario.value = response!;
    } finally {
      if (usuario.value.esAdmin == true) {
        storage.write("NOMBRE", usuario.value.nombre);
        storage.write("APELLIDO", usuario.value.apellido);
        storage.write("ADMIN", usuario.value.esAdmin);
        Get.to(() => HomePage());
      } else {
        Get.to(() => AvisosPage());
        Get.snackbar('Error', 'Contactese con Inmobiliaria Del Sur',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      }
    }
  }
}
