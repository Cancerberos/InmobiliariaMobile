import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inmobiliaria/views/pages/pages.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';

class InmuebleImagenesPage extends StatelessWidget {
  InmuebleImagenesPage({required this.inmueble, Key? key}) : super(key: key);

  final ImagePickerController _imagePickerController =
      Get.put(ImagePickerController());
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
                Get.to(() => InmuebleDetallePage(
                      inmueble: inmueble,
                    ));
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(height: 20),
                Obx(
                  () => _imagePickerController.selectedImagePath.value == ''
                      ? Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Card(
                                color: const Color.fromARGB(255, 11, 54, 90)
                                    .withOpacity(0.5),
                                shadowColor: Colors.black54,
                                elevation: 20.0,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/delSurBackground.jpeg')),
                                ),
                              ),
                            ),
                            const Text(
                              "Seleccione una imagen",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
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
                              child: Image.file(
                                File(_imagePickerController
                                    .selectedImagePath.value),
                              ),
                            ),
                          ),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (() {
                        _imagePickerController.getImage(ImageSource.gallery);
                      }),
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
                            padding: const EdgeInsets.all(3.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  ListTile(
                                    title:
                                        Text("Galería", style: titleTextStyle),
                                    trailing: Icon(
                                      Icons.photo,
                                      color: titleTextStyle.color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        _imagePickerController.getImage(ImageSource.camera);
                      }),
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
                                    title:
                                        Text("Cámara", style: titleTextStyle),
                                    trailing: Icon(
                                      Icons.camera_enhance,
                                      color: titleTextStyle.color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // if (inmueble.imagen!.isNotEmpty)
                //   ImageCarousel(inmueble)
                // else
                //   const Image(
                //       image: AssetImage('assets/delSurBackground.jpeg')),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _imagePickerController.agregarImagen();
            },
            tooltip: 'Guerdar Imagen',
            child: const Icon(Icons.save),
          ),
        ),
      ],
    );
  }
}
