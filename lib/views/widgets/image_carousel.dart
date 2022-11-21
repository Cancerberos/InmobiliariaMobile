import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../models/models.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel(this.aviso, {Key? key}) : super(key: key);

  final Aviso aviso;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        enlargeCenterPage: true,
        //aspectRatio: 2.05,
        viewportFraction: 0.85,
      ),
      itemCount: aviso.inmueble!.imagen!.length,
      itemBuilder: (context, index, realIndex) {
        return detalleImageCard(index);
      },
    );
  }

  Widget detalleImageCard(int index) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.memory(
          base64Decode(
              aviso.inmueble!.imagen![index].imagenDetalle!.bytes.toString()),
          fit: BoxFit.fill,
        ),
      );
}
