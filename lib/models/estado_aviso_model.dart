import 'dart:convert';

List<EstadoAviso> estadoAvisoFromJson(String str) => List<EstadoAviso>.from(
    json.decode(str).map((x) => EstadoAviso.fromJson(x)));

String estadoAvisoToJson(List<EstadoAviso> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstadoAviso {
  EstadoAviso({
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

  factory EstadoAviso.fromJson(Map<String, dynamic> json) => EstadoAviso(
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
