import 'dart:convert';

import 'package:inmobiliaria/models/models.dart';

List<InmuebleCaracteristica> inmuebleCaracteristicasFromJson(String str) =>
    List<InmuebleCaracteristica>.from(
        json.decode(str).map((x) => InmuebleCaracteristica.fromJson(x)));

String inmuebleCaracteristicasToJson(List<InmuebleCaracteristica> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

InmuebleCaracteristica inmuebleCaracteristicaFromJson(String str) =>
    InmuebleCaracteristica.fromJson(json.decode(str));

String inmuebleCaracteristicaToJson(InmuebleCaracteristica data) =>
    json.encode(data.toJson());

class InmuebleCaracteristica {
  InmuebleCaracteristica({
    this.logicalTypeName,
    this.objectIdentifier,
    this.tipoCaracteristica,
    this.cant,
  });

  final String? logicalTypeName;
  final String? objectIdentifier;
  TipoCaracteristica? tipoCaracteristica;
  int? cant;

  factory InmuebleCaracteristica.fromJson(Map<String, dynamic> json) =>
      InmuebleCaracteristica(
        logicalTypeName: json["logicalTypeName"],
        objectIdentifier: json["objectIdentifier"],
        tipoCaracteristica: json["tipoCaracteristica"] == null
            ? null
            : TipoCaracteristica.fromJson(json["tipoCaracteristica"]),
        cant: json["cant"],
      );

  Map<String, dynamic> toJson() => {
        "logicalTypeName": logicalTypeName,
        "objectIdentifier": objectIdentifier,
        "tipoCaracteristica": tipoCaracteristica,
        "cant": cant,
      };
}
