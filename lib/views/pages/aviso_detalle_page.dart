import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/models/avisos_model.dart';
import 'package:inmobiliaria/views/pages/avisos_page.dart';

import '../dialogs/aviso_contacto.dart';
import '../widgets/widgets.dart';

class AvisoDetallePage extends StatelessWidget {
  const AvisoDetallePage({required this.aviso, Key? key}) : super(key: key);

  final Aviso aviso;
  final textStyle = const TextStyle(
    fontSize: 20,
    overflow: TextOverflow.ellipsis,
    color: Color.fromARGB(255, 6, 43, 107),
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/delSurBackground.jpeg"),
                fit: BoxFit.fill),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(aviso.inmueble.descripcion),
            centerTitle: false,
            titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 6, 43, 107),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.fade,
            ),
            leading: IconButton(
              color: const Color.fromARGB(255, 6, 43, 107),
              onPressed: () {
                Get.offAll(() => AvisosPage());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 2, 34, 90),
              ),
            ),
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
          body: ListView(
            children: [
              ImageCarousel(aviso),
              AvisoDetalle(aviso: aviso),
              InmuebleCaracteristicas(aviso: aviso),
              InmuebleMapa(aviso: aviso),
              const Divider(
                height: 50,
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => avisoContacto(aviso, context),
            tooltip: 'Formulario de consulta de Aviso.',
            child: const Icon(Icons.question_answer),
          ),
        ),
      ],
    );
  }
}