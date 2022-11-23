import 'dart:convert';

List<AvisoContacto> avisoContactosFromJson(String str) =>
    List<AvisoContacto>.from(
        json.decode(str).map((x) => AvisoContacto.fromJson(x)));

String avisoContactosToJson(List<AvisoContacto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

AvisoContacto avisoContactoFromJson(String str) =>
    AvisoContacto.fromJson(json.decode(str));

String avisoContactoToJson(AvisoContacto data) => json.encode(data.toJson());

class AvisoContacto {
  AvisoContacto({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.aviso,
    required this.mensaje,
    required this.estadoContacto,
  });

  Nombre nombre;
  Apellido apellido;
  Email email;
  AvisoDeConsulta aviso;
  Mensaje mensaje;
  EstadoContacto estadoContacto;

  factory AvisoContacto.fromJson(Map<String, dynamic> json) => AvisoContacto(
        nombre: Nombre.fromJson(json["nombre"]),
        apellido: Apellido.fromJson(json["apellido"]),
        email: Email.fromJson(json["email"]),
        aviso: AvisoDeConsulta.fromJson(json["aviso"]),
        mensaje: Mensaje.fromJson(json["mensaje"]),
        estadoContacto: EstadoContacto.fromJson(json["estadoContacto"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre.toJson(),
        "apellido": apellido.toJson(),
        "email": email.toJson(),
        "aviso": aviso.toJson(),
        "mensaje": mensaje.toJson(),
        "estadoContacto": estadoContacto.toJson(),
      };
}

class Apellido {
  Apellido({
    required this.value,
  });

  String value;

  factory Apellido.fromJson(Map<String, dynamic> json) => Apellido(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Nombre {
  Nombre({
    required this.value,
  });

  String value;

  factory Nombre.fromJson(Map<String, dynamic> json) => Nombre(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Mensaje {
  Mensaje({
    required this.value,
  });

  String value;

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Email {
  Email({
    required this.value,
  });

  String value;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class AvisoDeConsulta {
  AvisoDeConsulta({
    required this.value,
  });

  ValueContacto value;

  factory AvisoDeConsulta.fromJson(Map<String, dynamic> json) =>
      AvisoDeConsulta(
        value: ValueContacto.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
      };
}

class EstadoContacto {
  EstadoContacto({
    required this.value,
  });

  ValueContacto value;

  factory EstadoContacto.fromJson(Map<String, dynamic> json) => EstadoContacto(
        value: ValueContacto.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
      };
}

class ValueContacto {
  ValueContacto({
    required this.rel,
    required this.href,
    required this.method,
    required this.type,
    required this.title,
  });

  String rel;
  String href;
  String method;
  String type;
  String title;

  factory ValueContacto.fromJson(Map<String, dynamic> json) => ValueContacto(
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
