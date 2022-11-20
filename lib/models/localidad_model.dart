import 'dart:convert';
import 'models.dart';

List<Localidad> localidadFromJson(String str) =>
    List<Localidad>.from(json.decode(str).map((x) => Localidad.fromJson(x)));

String localidadToJson(List<Localidad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Localidad {
  Localidad({
    this.provincia,
    this.codigoPostal,
    this.descripcion,
    this.rel,
    this.href,
    this.method,
    this.type,
    this.title,
  });

  final Provincia? provincia;
  final String? codigoPostal;
  final String? descripcion;
  final String? rel;
  final String? href;
  final String? method;
  final String? type;
  final String? title;

  factory Localidad.fromJson(Map<String, dynamic> json) => Localidad(
        provincia: json["provincia"] == null
            ? null
            : Provincia.fromJson(json["provincia"]),
        codigoPostal: json["codigoPostal"],
        descripcion: json["descripcion"],
        rel: json["rel"],
        href: json["href"],
        method: json["method"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "provincia": provincia?.toJson(),
        "codigoPostal": codigoPostal,
        "descripcion": descripcion,
        "rel": rel,
        "href": href,
        "method": method,
        "type": type,
        "title": title,
      };
}
