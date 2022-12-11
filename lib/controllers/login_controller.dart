import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../services/remote_service.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RemoteServices remoteServices = Get.put(RemoteServices());
  //late final RemoteServices remoteServices;
  var isPasswordHidden = true.obs;
  var usuario = UsuarioModel().obs;
  var isLoading = true.obs;

  void getUserValidation() async {
    try {
      isLoading(true);
      var response = await remoteServices.getUserValidation(
          usernameController, passwordController);
      usuario.value = response!;
    } finally {
      isLoading(false);
    }
  }
}
