import 'dart:convert';

import 'models.dart';

List<Imagen> imagenesFromJson(String str) =>
    List<Imagen>.from(json.decode(str).map((x) => Imagen.fromJson(x)));

String imagenesToJson(List<Imagen> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Imagen imagenFromJson(String str) => Imagen.fromJson(json.decode(str));

String imagenToJson(Imagen data) => json.encode(data.toJson());

class Imagen {
  Imagen({
    this.descripcion,
    this.url,
    this.logicalTypeName,
    this.objectIdentifier,
    this.datanucleusVersionTimestamp,
    this.imagenDetalle,
  });

  final String? descripcion;
  String? url;
  final String? logicalTypeName;
  final String? objectIdentifier;
  final int? datanucleusVersionTimestamp;
  ImagenDetalle? imagenDetalle;

  factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        descripcion: json["descripcion"],
        url: json["url"],
        logicalTypeName: json["logicalTypeName"],
        objectIdentifier: json["objectIdentifier"],
        datanucleusVersionTimestamp: json["datanucleusVersionTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "url": url,
        "logicalTypeName": logicalTypeName,
        "objectIdentifier": objectIdentifier,
        "datanucleusVersionTimestamp": datanucleusVersionTimestamp,
      };
}
