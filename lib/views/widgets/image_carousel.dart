import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inmobiliaria/models/avisos_mock_model.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel(this.aviso, {Key? key}) : super(key: key);

  final AvisoMock aviso;

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
      itemCount: aviso.inmueble.imagen.length,
      itemBuilder: (context, index, realIndex) {
        return detalleImageCard(index);
      },
    );
  }

  Widget detalleImageCard(int index) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.memory(
          base64Decode(aviso.inmueble.imagen[index].bytes),
          fit: BoxFit.fill,
        ),
      );
}
