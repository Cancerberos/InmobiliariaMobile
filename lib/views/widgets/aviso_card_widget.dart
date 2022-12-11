import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmobiliaria/views/pages/aviso_detalle_page.dart';

import '../../models/models.dart';

class InfoAviso extends StatelessWidget {
  const InfoAviso({Key? key, required this.aviso}) : super(key: key);

  final textStyle1 = const TextStyle(
    fontSize: 14,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
  );
  final textStyle2 = const TextStyle(
      fontSize: 22,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  final Aviso aviso;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.to(() => AvisoDetallePage(aviso: aviso))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 10,
        height: 250,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width - 25,
              top: 5,
              bottom: 5,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: (aviso.inmueble!.imagen!.isNotEmpty)
                    ? Image.memory(
                        base64Decode(aviso
                            .inmueble!.imagen![0].imagenDetalle!.bytes
                            .toString()),
                        fit: BoxFit.fill,
                      )
                    : const Image(
                        image: AssetImage('assets/delSurBackground.jpeg')),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width - 35,
              //left: 20,
              bottom: 9,
              //right: 20,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(aviso.inmueble!.descripcion.toString(),
                      style: textStyle2),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: textStyle1.color,
                      ),
                      Text("${aviso.inmueble!.localidad!.title}.",
                          style: textStyle1),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.sell_outlined,
                        color: textStyle1.color,
                      ),
                      Text(aviso.tipoOperacion!.title.toString(),
                          style: textStyle1),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\$ ${aviso.valor}", style: textStyle2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
