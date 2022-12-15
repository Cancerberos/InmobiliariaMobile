import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/views/pages/pages.dart';

import '../../models/models.dart';
import '../widgets/widgets.dart';

class InmuebleDetallePage extends StatelessWidget {
  const InmuebleDetallePage({required this.inmueble, Key? key})
      : super(key: key);

  final Inmueble inmueble;

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
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
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
            title: Text(inmueble.descripcion.toString()),
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
                Get.to(() => HomePage());
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                  onTap: (() {}),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      color: const Color.fromARGB(255, 11, 54, 90)
                          .withOpacity(0.5),
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
                                title: Text("Características",
                                    style: titleTextStyle),
                                trailing: const Icon(Icons.attribution),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (() =>
                      Get.to(() => InmuebleImagenesPage(inmueble: inmueble))),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      color: const Color.fromARGB(255, 11, 54, 90)
                          .withOpacity(0.5),
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
                                title: Text("Imágenes", style: titleTextStyle),
                                trailing:
                                    const Icon(Icons.picture_in_picture_alt),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 8),
              // if (inmueble.imagen!.isNotEmpty)
              //   ImageCarousel(inmueble)
              // else
              //   const Image(image: AssetImage('assets/delSurBackground.jpeg')),
              const SizedBox(height: 8),
              InmuebleDetalle(inmueble: inmueble),
              //InmuebleCaracteristicas(aviso: aviso),
              InmuebleMapa(inmueble: inmueble),
              const Divider(height: 50)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.to(() => InmuebleEditarPage(
                  inmueble: inmueble,
                )),
            tooltip: 'Editar Inmueble',
            child: const Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
}
