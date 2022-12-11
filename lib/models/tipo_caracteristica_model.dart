import 'dart:convert';

List<TipoCaracteristica> tipoCaracteristicasFromJson(String str) =>
    List<TipoCaracteristica>.from(
        json.decode(str).map((x) => TipoCaracteristica.fromJson(x)));

String tipoCaracteristicasToJson(List<TipoCaracteristica> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

TipoCaracteristica tipoCaracteristicaFromJson(String str) =>
    TipoCaracteristica.fromJson(json.decode(str));

String tipoCaracteristicaToJson(TipoCaracteristica data) =>
    json.encode(data.toJson());

class TipoCaracteristica {
  TipoCaracteristica({
    this.rel,
    this.href,
    this.method,
    this.type,
    this.title,
  });

  final String? rel;
  final String? href;
  final String? method;
  final String? type;
  final String? title;

  factory TipoCaracteristica.fromJson(Map<String, dynamic> json) =>
      TipoCaracteristica(
        rel: json["rel"],
        href: json["href"],
        method: json["method"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel,
        "href": href,
        "method": method,
        "type": type,
        "title": title,
      };
}
