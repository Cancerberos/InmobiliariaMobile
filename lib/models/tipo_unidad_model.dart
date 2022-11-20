import 'dart:convert';

List<TipoUnidad> tipoUnidadFromJson(String str) =>
    List<TipoUnidad>.from(json.decode(str).map((x) => TipoUnidad.fromJson(x)));

String tipoUnidadToJson(List<TipoUnidad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipoUnidad {
  TipoUnidad({
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

  factory TipoUnidad.fromJson(Map<String, dynamic> json) => TipoUnidad(
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
