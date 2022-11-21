import 'dart:convert';
import 'models.dart';

List<Aviso> avisoFromJson(String str) =>
    List<Aviso>.from(json.decode(str).map((x) => Aviso.fromJson(x)));

String avisoToJson(List<Aviso> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aviso {
  Aviso({
    this.avisoId,
    this.descripcion,
    this.inmueble,
    this.valor,
    this.tipoOperacion,
    this.fechaInicio,
    this.fechaFin,
    this.estadoAviso,
    this.rel,
    this.href,
    this.method,
    this.type,
    this.title,
  });

  final int? avisoId;
  final String? descripcion;
  Inmueble? inmueble;
  final double? valor;
  final TipoOperacion? tipoOperacion;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final EstadoAviso? estadoAviso;
  final String? rel;
  final String? href;
  final String? method;
  final String? type;
  final String? title;

  factory Aviso.fromJson(Map<String, dynamic> json) => Aviso(
        avisoId: json["aviso_Id"],
        descripcion: json["descripcion"],
        inmueble: json["inmueble"] == null
            ? null
            : Inmueble.fromJson(json["inmueble"]),
        valor: json["valor"],
        tipoOperacion: json["tipoOperacion"] == null
            ? null
            : TipoOperacion.fromJson(json["tipoOperacion"]),
        fechaInicio: json["fechaInicio"] == null
            ? null
            : DateTime.parse(json["fechaInicio"]),
        fechaFin:
            json["fechaFin"] == null ? null : DateTime.parse(json["fechaFin"]),
        estadoAviso: json["estadoAviso"] == null
            ? null
            : EstadoAviso.fromJson(json["estadoAviso"]),
        rel: json["rel"],
        href: json["href"],
        method: json["method"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "aviso_Id": avisoId,
        "descripcion": descripcion,
        "inmueble": inmueble?.toJson(),
        "valor": valor,
        "tipoOperacion": tipoOperacion?.toJson(),
        "fechaInicio": fechaInicio?.toIso8601String(),
        "fechaFin": fechaFin?.toIso8601String(),
        "estadoAviso": estadoAviso?.toJson(),
        "rel": rel,
        "href": href,
        "method": method,
        "type": type,
        "title": title,
      };
}
