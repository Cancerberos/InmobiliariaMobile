import 'dart:convert';
import 'models.dart';

List<Cliente> clienteFromJson(String str) =>
    List<Cliente>.from(json.decode(str).map((x) => Cliente.fromJson(x)));

String clienteToJson(List<Cliente> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cliente {
  Cliente({
    this.apellido,
    this.email,
    this.nombre,
    this.telefono,
    this.calle,
    this.altura,
    this.edificacion,
    this.departamento,
    this.latitud,
    this.longitud,
    this.piso,
    this.localidad,
    this.rel,
    this.href,
    this.method,
    this.type,
    this.title,
  });

  final String? apellido;
  final String? email;
  final String? nombre;
  final String? telefono;
  final String? calle;
  final String? altura;
  final String? edificacion;
  final String? departamento;
  final String? latitud;
  final String? longitud;
  final String? piso;
  final Localidad? localidad;
  final String? rel;
  final String? href;
  final String? method;
  final String? type;
  final String? title;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        apellido: json["apellido"],
        email: json["email"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        calle: json["calle"],
        altura: json["altura"],
        edificacion: json["edificacion"],
        departamento: json["departamento"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        piso: json["piso"],
        localidad: json["localidad"] == null
            ? null
            : Localidad.fromJson(json["localidad"]),
        rel: json["rel"],
        href: json["href"],
        method: json["method"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "apellido": apellido,
        "email": email,
        "nombre": nombre,
        "telefono": telefono,
        "calle": calle,
        "altura": altura,
        "edificacion": edificacion,
        "departamento": departamento,
        "latitud": latitud,
        "longitud": longitud,
        "piso": piso,
        "localidad": localidad?.toJson(),
        "rel": rel,
        "href": href,
        "method": method,
        "type": type,
        "title": title,
      };
}
