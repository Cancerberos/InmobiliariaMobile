//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/controllers.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());
  final ScrollController _scrollController = ScrollController();

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
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              storage.erase();
              Get.to(() => AvisosPage());
            },
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 2, 34, 90),
            ),
          ),
          title: const Text('Inmobiliaria Del Sur'),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 6, 43, 107),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                _homeController.onInit();
              },
              icon: const Icon(
                Icons.refresh,
                color: Color.fromARGB(255, 2, 34, 90),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/delSurIcon.png'),
              ),
            ),
            const SizedBox(width: 10.0),
          ]),
      body: Column(
        children: [
          avisosListButton(),
          Expanded(
            child: Obx(
              () {
                if (_homeController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    controller: _scrollController,
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
          ),
        ],
      ),
    );
  }

  avisosListButton() {
    return InkWell(
      onTap: (() => Get.to(() => AvisosPage())),
      child: SizedBox(
        width: 250,
        height: 50,
        child: Card(
          color: const Color.fromARGB(255, 11, 54, 90).withOpacity(0.5),
          shadowColor: Colors.black54,
          elevation: 20.0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Text(
              "Ir a la lista de avisos",
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
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
        const Divider(height: 1),
      ],
    );
  }
}
