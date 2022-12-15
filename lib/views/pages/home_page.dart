//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/controllers.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());
  final storage = GetStorage();
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
      appBar: AppBar(title: const Text('Inmobiliaria Del Sur'), actions: [
        IconButton(
          onPressed: () {
            storage.erase();
            Get.to(() => AvisosPage());
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  avisosListButton(),
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
