import 'dart:convert';

ImagenDetalle imagenDelleFromJson(String? str) =>
    ImagenDetalle.fromJson(json.decode(str!));

String imagenDetalleToJson(ImagenDetalle data) => json.encode(data.toJson());

List<ImagenDetalle> imagenesDetalleFromJson(String str) =>
    List<ImagenDetalle>.from(
        json.decode(str).map((x) => ImagenDetalle.fromJson(x)));

String imagenesDetalleToJson(List<ImagenDetalle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImagenDetalle {
  ImagenDetalle({
    this.name,
    this.mimeType,
    this.bytes,
  });

  final String? name;
  final String? mimeType;
  final String? bytes;

  factory ImagenDetalle.fromJson(Map<String, dynamic> json) => ImagenDetalle(
        name: json["name"],
        mimeType: json["mimeType"],
        bytes: json["bytes"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mimeType": mimeType,
        "bytes": bytes,
      };
}
