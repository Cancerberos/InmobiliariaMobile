import 'dart:convert';

List<TipoOperacion> tipoOperacionFromJson(String str) =>
    List<TipoOperacion>.from(
        json.decode(str).map((x) => TipoOperacion.fromJson(x)));

String tipoOperacionToJson(List<TipoOperacion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipoOperacion {
  TipoOperacion({
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

  factory TipoOperacion.fromJson(Map<String, dynamic> json) => TipoOperacion(
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
