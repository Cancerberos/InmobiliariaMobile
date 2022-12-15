import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../pages/pages.dart';

final LoginController _loginController = Get.put(LoginController());

Future loginDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
            'Area de Uso Administrativo.\nIngrese sus credenciales: '),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _loginController.usernameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Ingrese su Nombre',
                  hintStyle: const TextStyle(color: Colors.black),
                  labelText: 'Nombre',
                  labelStyle: const TextStyle(color: Colors.black),
                  suffixIcon: const Icon(
                    Icons.person_add_alt_1_outlined,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const Divider(),
              TextFormField(
                controller: _loginController.passwordController,
                obscureText: _loginController.isPasswordHidden.value,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Ingrese su contraseña',
                  hintStyle: const TextStyle(color: Colors.black),
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(color: Colors.black),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _loginController.isPasswordHidden.value =
                          _loginController.isPasswordHidden.value;
                    },
                    child: Icon(
                      _loginController.isPasswordHidden.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              try {
                _loginController.getUserValidation();
              } finally {
                // TODO descomentar para producción
                // _loginController.usernameController.clear();
                // _loginController.passwordController.clear();
              }
            },
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => AvisosPage());
              Navigator.of(context).pop();
            },
            child: const Text('Lista de aviso'),
          )
        ],
      ),
    );
