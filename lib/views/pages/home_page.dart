import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/views/pages/avisos_mock_page.dart';

import '../../controllers/controllers.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());
  final AvisosController _avisosController = Get.put(AvisosController());
  final isPasswordHidden = LoginController().isPasswordHidden;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inmobiliaria Del Sur'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    avisosListButton(),
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Divider(),
                    TextFormField(
                      controller: _loginController.passwordController,
                      obscureText: isPasswordHidden.value,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[700]?.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Ingrese su contraseña',
                        hintStyle: const TextStyle(color: Colors.blueGrey),
                        labelText: 'Contraseña',
                        labelStyle: const TextStyle(color: Colors.blueGrey),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            isPasswordHidden.value = !isPasswordHidden.value;
                          },
                          child: Icon(
                            isPasswordHidden.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    loginButton(),
                    Text(_loginController.usuario.value.nombre ??
                        'Usuario sin nombre'),
                    Text(_loginController.usuario.value.apellido ??
                        'Usuario sin apellido'),
                    Text(_loginController.usuario.value.esAdmin.toString()),
                    Text(_loginController.usuario.value.email ??
                        'Usuario sin email'),
                    getAvisosButton(),
                    Text(_avisosController.avisosList[0].descripcion ??
                        'Usuario sin nombre'),
                    Text(
                        _avisosController.avisosList[0].inmueble?.descripcion ??
                            'Usuario sin nombre'),
                    Text(_avisosController.avisosList[1].descripcion ??
                        'Usuario sin nombre'),
                    Text(
                        _avisosController.avisosList[1].inmueble?.descripcion ??
                            'Usuario sin nombre'),
                    Text(_avisosController.avisosList[2].descripcion ??
                        'Usuario sin nombre'),
                    Text(
                        _avisosController.avisosList[2].inmueble?.descripcion ??
                            'Usuario sin nombre'),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.memory(
                        base64Decode(_avisosController.avisosList[0].inmueble!
                            .imagen![0].imagenDetalle!.bytes
                            .toString()),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  avisosListButton() {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => AvisosPage());
      },
      child: const Text('Lista de aviso'),
    );
  }

  loginButton() {
    return ElevatedButton(
      onPressed: () {
        _loginController.getUserValidation();
        print(_loginController.usuario.value.nombre);
      },
      child: const Text('Login'),
    );
  }

  getAvisosButton() {
    return ElevatedButton(
      onPressed: () {
        _avisosController.fetchAvisos();
        print(_avisosController.avisosList[0].descripcion);
      },
      child: const Text('Get Avisos'),
    );
  }
}
