// To parse this JSON data, do
//
//     final inmueble = inmuebleFromJson(jsonString);

import 'dart:convert';
import 'models.dart';

List<Inmueble> inmueblesFromJson(String str) =>
    List<Inmueble>.from(json.decode(str).map((x) => Inmueble.fromJson(x)));

String inmueblesToJson(List<Inmueble> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Inmueble inmuebleFromJson(String str) => Inmueble.fromJson(json.decode(str));

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
    this.imagen,
    this.inmueble,
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
  List<Imagen>? imagen;
  final List<TipoCaracteristica>? inmueble;

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
        imagen: json["imagen"] == null
            ? null
            : List<Imagen>.from(json["imagen"].map((x) => Imagen.fromJson(x))),
        inmueble: json["inmueble"] == null
            ? null
            : List<TipoCaracteristica>.from(
                json["inmueble"].map((x) => TipoCaracteristica.fromJson(x))),
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
        "imagen": imagen == null
            ? null
            : List<dynamic>.from(imagen!.map((x) => x.toJson())),
        "inmueble": inmueble == null
            ? null
            : List<dynamic>.from(inmueble!.map((x) => x.toJson())),
      };
}
