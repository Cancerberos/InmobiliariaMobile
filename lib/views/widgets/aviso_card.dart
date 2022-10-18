import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/models/avisos_model.dart';
import 'package:inmobiliaria/views/pages/aviso_detalle_page.dart';

class InfoAviso extends StatelessWidget {
  const InfoAviso({Key? key, required this.aviso}) : super(key: key);

  final textStyle = const TextStyle(
      fontSize: 14, overflow: TextOverflow.ellipsis, color: Colors.white);

  final Aviso aviso;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.to(AvisoDetallePage(aviso: aviso))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        height: 150,
        child: Card(
          color: Colors.grey[500]?.withOpacity(0.5),
          shadowColor: Colors.black54,
          elevation: 20.0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Aviso: ", style: textStyle),
                      Text("Inmueble: ", style: textStyle),
                      Text("Dirección: ", style: textStyle),
                      Text("Valor: ", style: textStyle),
                      Text("Tipo Operación: ", style: textStyle),
                      Text("Estado Aviso:  ", style: textStyle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(aviso.descripcion, style: textStyle),
                      Text(aviso.inmueble.descripcion, style: textStyle),
                      Text(
                          "${aviso.inmueble.direccion.localidad.descripcion} ${aviso.inmueble.direccion.localidad.provincia.descripcion}",
                          style: textStyle),
                      Text(aviso.valor, style: textStyle),
                      Text(aviso.tipoOperacion.descripcion, style: textStyle),
                      Text(
                        aviso.estadoAviso.descripcion,
                        style: textStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Image.memory(
                    base64Decode(aviso.inmueble.imagen[0].bytes),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
