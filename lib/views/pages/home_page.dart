//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());
  final HomeController _homeController = Get.put(HomeController());
  final isPasswordHidden = LoginController().isPasswordHidden;

  final titleTextStyle = const TextStyle(
    fontSize: 20,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final subTitleTextStyle = const TextStyle(
    fontSize: 12,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

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
                          color: Colors.blueGrey,
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
                    Obx(
                      () {
                        if (_homeController.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(5),
                            itemCount: _homeController.inmueblesList.length,
                            itemBuilder: (context, index) {
                              return buildCard(index, context);
                            },
                          );
                        }
                      },
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
      },
      child: const Text('Login'),
    );
  }

  Widget buildCard(int index, context) {
    _homeController.index.value = index;
    return Column(
      children: [
        const Divider(height: 2),
        InkWell(
          onTap: (() => Get.to(() => InmuebleDetallePage(
                inmueble: _homeController.inmueblesList[index],
              ))),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 15,
            child: Card(
              color: const Color.fromARGB(255, 11, 54, 90).withOpacity(0.5),
              shadowColor: Colors.black54,
              elevation: 20.0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                            _homeController.inmueblesList[index].descripcion
                                    ?.toString() ??
                                "",
                            style: titleTextStyle),
                        subtitle: Text(
                            "${_homeController.inmueblesList[index].calle?.toString()} ${_homeController.inmueblesList[index].altura?.toString()}",
                            style: subTitleTextStyle),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  // getAvisosButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       _avisosController.fetchAvisos();
  //     },
  //     child: const Text('Get Avisos'),
  //   );
  // }
}
