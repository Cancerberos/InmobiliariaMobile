import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/views/pages/pages.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';

class InmuebleEditarPage extends StatelessWidget {
  InmuebleEditarPage({required this.inmueble, Key? key}) : super(key: key);

  final Inmueble inmueble;
  final InmuebleEditarController _inmuebleEditarController =
      Get.put(InmuebleEditarController());

  final textStyle = const TextStyle(
    fontSize: 20,
    overflow: TextOverflow.ellipsis,
    color: Color.fromARGB(255, 231, 233, 237),
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
                Get.to(() => InmuebleDetallePage(inmueble: inmueble));
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
            padding: const EdgeInsets.all(10),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    style: textStyle,
                    controller:
                        _inmuebleEditarController.descripcionController =
                            TextEditingController(text: inmueble.descripcion),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Descripción",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.description,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.descripcion,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller:
                        _inmuebleEditarController.fechaExclusividadController =
                            TextEditingController(
                                text: inmueble.fechaExclusividad.toString()),
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Fecha de Exclusividad",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.fechaExclusividad.toString(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Fecha de Exclusividad';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.calleController =
                        TextEditingController(text: inmueble.calle),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Calle",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.signpost,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.calle,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.alturaController =
                        TextEditingController(text: inmueble.altura),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Altura",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.edit_road,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.altura,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller:
                        _inmuebleEditarController.edificacionController =
                            TextEditingController(text: inmueble.edificacion),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Edificación",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.home_work,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.edificacion,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.pisoController =
                        TextEditingController(text: inmueble.piso),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Piso",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.corporate_fare,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.piso,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller:
                        _inmuebleEditarController.departamentoController =
                            TextEditingController(text: inmueble.departamento),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Departamento",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.domain_add,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.departamento,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.tipoUnidadController =
                        TextEditingController(text: inmueble.tipoUnidad?.title),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Tipo Unidad",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.bungalow,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.tipoUnidad?.title,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.clienteController =
                        TextEditingController(text: inmueble.cliente?.title),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Cliente",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.person_add_alt_1_outlined,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.cliente?.title,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.localidadController =
                        TextEditingController(text: inmueble.localidad?.title),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Localidad",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.location_city,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.localidad?.title,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.latitudController =
                        TextEditingController(text: inmueble.latitud),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Latitud",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.location_on,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.latitud,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    style: textStyle,
                    controller: _inmuebleEditarController.longitudController =
                        TextEditingController(text: inmueble.longitud),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Longitud",
                      labelStyle: textStyle,
                      suffixIcon: Icon(
                        Icons.location_on_outlined,
                        color: textStyle.color,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: inmueble.longitud,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatorio';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        try {
                          _inmuebleEditarController
                                  .inmueble.value.altura.value =
                              _inmuebleEditarController.alturaController.text
                                  .toUpperCase();
                          _inmuebleEditarController.inmueble.value.calle.value =
                              _inmuebleEditarController.calleController.text
                                  .toUpperCase();
                          _inmuebleEditarController
                                  .inmueble.value.departamento.value =
                              _inmuebleEditarController
                                  .departamentoController.text
                                  .toUpperCase();
                          _inmuebleEditarController
                                  .inmueble.value.descripcion.value =
                              _inmuebleEditarController
                                  .descripcionController.text
                                  .toUpperCase();
                          _inmuebleEditarController
                                  .inmueble.value.edificacion.value =
                              _inmuebleEditarController
                                  .edificacionController.text
                                  .toUpperCase();
                          _inmuebleEditarController
                                  .inmueble.value.fechaExclusividad.value =
                              _inmuebleEditarController
                                  .fechaExclusividadController.value.text
                                  .replaceRange(10, 11, "T");
                          _inmuebleEditarController
                                  .inmueble.value.latitud.value =
                              _inmuebleEditarController.latitudController.text
                                  .toUpperCase();
                          _inmuebleEditarController
                                  .inmueble.value.longitud.value =
                              _inmuebleEditarController.longitudController.text
                                  .toUpperCase();
                          _inmuebleEditarController.inmueble.value.piso.value =
                              _inmuebleEditarController.pisoController.text
                                  .toUpperCase();

                          // href Cliente
                          _inmuebleEditarController.inmueble.value.cliente.value
                              .href = inmueble.cliente!.href.toString();

                          // title Cliente
                          _inmuebleEditarController.inmueble.value.cliente.value
                              .title = inmueble.cliente!.title.toString();

                          // href Localidad
                          _inmuebleEditarController.inmueble.value.localidad
                              .value.href = inmueble.localidad!.href.toString();

                          // title Localidad
                          _inmuebleEditarController
                              .inmueble
                              .value
                              .localidad
                              .value
                              .title = inmueble.localidad!.title.toString();

                          // href TipoUnidad
                          _inmuebleEditarController
                              .inmueble
                              .value
                              .tipoUnidad
                              .value
                              .href = inmueble.tipoUnidad!.href.toString();

                          // title TipoUnidad
                          _inmuebleEditarController
                              .inmueble
                              .value
                              .tipoUnidad
                              .value
                              .title = inmueble.tipoUnidad!.title.toString();
                        } finally {
                          _inmuebleEditarController.editarInmueble(
                              /*inmueble.href*/);
                        }
                      },
                      child: const Text('Guardar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => avisoContacto(aviso, context),
          //   tooltip: 'Formulario para consulta de Aviso.',
          //   child: const Icon(Icons.question_answer),
          // ),
        ),
      ],
    );
  }
}
