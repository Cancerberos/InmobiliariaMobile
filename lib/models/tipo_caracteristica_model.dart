import 'dart:convert';

List<TipoCaracteristica> tipoCaracteristicaFromJson(String str) =>
    List<TipoCaracteristica>.from(
        json.decode(str).map((x) => TipoCaracteristica.fromJson(x)));

String tipoCaracteristicaToJson(List<TipoCaracteristica> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipoCaracteristica {
  TipoCaracteristica({
    this.descripcion,
    this.rel,
    this.href,
    this.method,
    this.type,
    this.title,
  });

  final String? descripcion;
  final String? rel;
  final String? href;
  final String? method;
  final String? type;
  final String? title;

  factory TipoCaracteristica.fromJson(Map<String, dynamic> json) =>
      TipoCaracteristica(
        descripcion: json["descripcion"],
        rel: json["rel"],
        href: json["href"],
        method: json["method"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "rel": rel,
        "href": href,
        "method": method,
        "type": type,
        "title": title,
      };
}
