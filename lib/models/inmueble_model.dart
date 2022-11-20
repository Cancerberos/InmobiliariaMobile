// To parse this JSON data, do
//
//     final inmueble = inmuebleFromJson(jsonString);

import 'dart:convert';
import 'models.dart';

List<Inmueble> inmuebleFromJson(String str) =>
    List<Inmueble>.from(json.decode(str).map((x) => Inmueble.fromJson(x)));

String inmuebleToJson(List<Inmueble> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inmueble {
  Inmueble({
    this.descripcion,
    this.fechaExclusividad,
    this.calle,
    this.altura,
    this.edificacion,
    this.piso,
    this.departamento,
    this.latitud,
    this.longitud,
    this.cli,
    this.u,
    this.cliente,
    this.localidad,
    this.prov,
    this.tipoUnidad,
    this.rel,
    this.href,
    this.method,
    this.type,
    this.title,
  });

  final String? descripcion;
  final DateTime? fechaExclusividad;
  final String? calle;
  final String? altura;
  final String? edificacion;
  final String? piso;
  final String? departamento;
  final String? latitud;
  final String? longitud;
  final String? cli;
  final String? u;
  final Cliente? cliente;
  final Localidad? localidad;
  final String? prov;
  final TipoUnidad? tipoUnidad;
  final String? rel;
  final String? href;
  final String? method;
  final String? type;
  final String? title;

  factory Inmueble.fromJson(Map<String, dynamic> json) => Inmueble(
        descripcion: json["descripcion"],
        fechaExclusividad: json["fechaExclusividad"] == null
            ? null
            : DateTime.parse(json["fechaExclusividad"]),
        calle: json["calle"],
        altura: json["altura"],
        edificacion: json["edificacion"],
        piso: json["piso"],
        departamento: json["departamento"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        cli: json["cli"],
        u: json["u"],
        cliente:
            json["cliente"] == null ? null : Cliente.fromJson(json["cliente"]),
        localidad: json["localidad"] == null
            ? null
            : Localidad.fromJson(json["localidad"]),
        prov: json["prov"],
        tipoUnidad: json["tipoUnidad"] == null
            ? null
            : TipoUnidad.fromJson(json["tipoUnidad"]),
        rel: json["rel"],
        href: json["href"],
        method: json["method"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "fechaExclusividad": fechaExclusividad?.toIso8601String(),
        "calle": calle,
        "altura": altura,
        "edificacion": edificacion,
        "piso": piso,
        "departamento": departamento,
        "latitud": latitud,
        "longitud": longitud,
        "cli": cli,
        "u": u,
        "cliente": cliente?.toJson(),
        "localidad": localidad?.toJson(),
        "prov": prov,
        "tipoUnidad": tipoUnidad?.toJson(),
        "rel": rel,
        "href": href,
        "method": method,
        "type": type,
        "title": title,
      };
}
