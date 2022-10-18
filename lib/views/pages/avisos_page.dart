import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/avisos_controller.dart';
import '../widgets/widgets.dart';

class AvisosPage extends StatelessWidget {
  AvisosPage({Key? key}) : super(key: key);

  final AvisosController avisosController = Get.put(AvisosController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
            imageURLParameter: 'assets/delSurBackground.jpeg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const SizedBox(width: 10.0),
            title: const Text('Avisos de Propiedades'),
            centerTitle: false,
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 6, 43, 107),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            actions: const [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/delSurIcon.png'),
                ),
              ),
              SizedBox(width: 10.0),
            ],
          ),
          body: Obx(
            () {
              if (avisosController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: avisosController.avisosList2.length,
                  itemBuilder: (context, index) {
                    return buildCard(index);
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildCard(int index) {
    avisosController.index.value = index;
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 5.0,
      color: Colors.blue.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          const Divider(height: 5),
          InfoAviso(aviso: avisosController.avisosList2[index]),
          const Divider(height: 8),
        ],
      ),
    );
  }
}