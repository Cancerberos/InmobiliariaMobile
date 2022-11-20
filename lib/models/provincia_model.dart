import 'dart:convert';

List<Provincia> provinciaFromJson(String str) =>
    List<Provincia>.from(json.decode(str).map((x) => Provincia.fromJson(x)));

String provinciaToJson(List<Provincia> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provincia {
  Provincia({
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

  factory Provincia.fromJson(Map<String, dynamic> json) => Provincia(
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
