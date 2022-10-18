import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inmobiliaria/models/avisos_model.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel(this.aviso, {Key? key}) : super(key: key);

  final Aviso aviso;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.7,
      ),
      itemCount: aviso.inmueble.imagen.length,
      itemBuilder: (context, index, realIndex) {
        return detalleImageCard(index);
      },
    );
  }

  Widget detalleImageCard(int index) => Image.memory(
        base64Decode(aviso.inmueble.imagen[index].bytes),
      );
}
