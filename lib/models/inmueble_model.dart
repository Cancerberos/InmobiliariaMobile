// To parse this JSON data, do
//
//     final inmueble = inmuebleFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

List<Inmueble> inmueblesFromJson(String str) =>
    List<Inmueble>.from(json.decode(str).map((x) => Inmueble.fromJson(x)));

String inmueblesToJson(List<Inmueble> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Inmueble inmuebleFromJson(String str) => Inmueble.fromJson(json.decode(str));

String inmuebleToJson(Inmueble data) => json.encode(data.toJson());

class Inmueble {
  Inmueble({
    this.inmuebleid,
    this.descripcion,
    this.fechaExclusividad,
    this.calle,
    this.altura,
    this.edificacion,
    this.piso,
    this.departamento,
    this.latitud,
    this.longitud,
    this.cli,
    this.u,
    this.cliente,
    this.localidad,
    this.prov,
    this.tipoUnidad,
    this.rel,
    this.href,
    this.method,
    this.type,
    this.title,
    this.imagen,
    this.inmueble,
  });

  int? inmuebleid;
  String? descripcion;
  DateTime? fechaExclusividad;
  String? calle;
  String? altura;
  String? edificacion;
  String? piso;
  String? departamento;
  String? latitud;
  String? longitud;
  String? cli;
  String? u;
  Cliente? cliente;
  Localidad? localidad;
  String? prov;
  TipoUnidad? tipoUnidad;
  String? rel;
  String? href;
  String? method;
  String? type;
  String? title;
  List<Imagen>? imagen;
  List<InmuebleCaracteristica>? inmueble;

  factory Inmueble.fromJson(Map<String, dynamic> json) => Inmueble(
        inmuebleid: json["inmuebleid"] == null ? null : json["inmuebleid"],
        descripcion: json["descripcion"],
        fechaExclusividad: json["fechaExclusividad"] == null
            ? null
            : DateTime.parse(json["fechaExclusividad"]),
        calle: json["calle"],
        altura: json["altura"],
        edificacion: json["edificacion"],
        piso: json["piso"],
        departamento: json["departamento"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        cli: json["cli"],
        u: json["u"],
        cliente:
            json["cliente"] == null ? null : Cliente.fromJson(json["cliente"]),
        localidad: json["localidad"] == null
            ? null
            : Localidad.fromJson(json["localidad"]),
        prov: json["prov"],
        tipoUnidad: json["tipoUnidad"] == null
            ? null
            : TipoUnidad.fromJson(json["tipoUnidad"]),
        rel: json["rel"],
        href: json["href"],
        method: json["method"],
        type: json["type"],
        title: json["title"],
        imagen: json["imagen"] == null
            ? null
            : List<Imagen>.from(json["imagen"].map((x) => Imagen.fromJson(x))),
        inmueble: json["inmueble"] == null
            ? null
            : List<InmuebleCaracteristica>.from(json["inmueble"]
                .map((x) => InmuebleCaracteristica.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "inmuebleid": inmuebleid,
        "descripcion": descripcion,
        "fechaExclusividad": fechaExclusividad?.toIso8601String(),
        "calle": calle,
        "altura": altura,
        "edificacion": edificacion,
        "piso": piso,
        "departamento": departamento,
        "latitud": latitud,
        "longitud": longitud,
        "cli": cli,
        "u": u,
        "cliente": cliente?.toJson(),
        "localidad": localidad?.toJson(),
        "prov": prov,
        "tipoUnidad": tipoUnidad?.toJson(),
        "rel": rel,
        "href": href,
        "method": method,
        "type": type,
        "title": title,
        "imagen": imagen == null
            ? null
            : List<dynamic>.from(imagen!.map((x) => x.toJson())),
        "inmueble": inmueble == null
            ? null
            : List<InmuebleCaracteristica>.from(
                inmueble!.map((x) => x.toJson())),
      };
}

EditarInmueble editarInmuebleFromJson(String str) =>
    EditarInmueble.fromJson(json.decode(str));

String editarInmuebleToJson(EditarInmueble data) => json.encode(data.toJson());

class EditarInmueble {
  EditarInmueble({
    this.descripcion,
    this.fechaExclusividad,
    this.calle,
    this.altura,
    this.edificacion,
    this.piso,
    this.departamento,
    this.latitud,
    this.longitud,
    this.localidad,
    this.tipoUnidad,
    this.cliente,
  });
  Descripcion? descripcion;
  FechaExclusividad? fechaExclusividad;
  Calle? calle;
  Altura? altura;
  Edificacion? edificacion;
  Piso? piso;
  Departamento? departamento;
  Latitud? latitud;
  Longitud? longitud;
  LocalidadEditar? localidad;
  TipoUnidadEditar? tipoUnidad;
  ClienteEditar? cliente;

  factory EditarInmueble.fromJson(Map<String, dynamic> json) => EditarInmueble(
        descripcion: Descripcion.fromJson(json["descripcion"]),
        fechaExclusividad:
            FechaExclusividad.fromJson(json["fechaExclusividad"]),
        calle: Calle.fromJson(json["calle"]),
        altura: Altura.fromJson(json["altura"]),
        edificacion: Edificacion.fromJson(json["edificacion"]),
        piso: Piso.fromJson(json["piso"]),
        departamento: Departamento.fromJson(json["departamento"]),
        latitud: Latitud.fromJson(json["latitud"]),
        longitud: Longitud.fromJson(json["longitud"]),
        localidad: LocalidadEditar.fromJson(json["localidad"]),
        tipoUnidad: TipoUnidadEditar.fromJson(json["tipoUnidad"]),
        cliente: ClienteEditar.fromJson(json["cliente"]),
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion?.toJson(),
        "fechaExclusividad": fechaExclusividad?.toJson(),
        "calle": calle?.toJson(),
        "altura": altura?.toJson(),
        "edificacion": edificacion?.toJson(),
        "piso": piso?.toJson(),
        "departamento": departamento?.toJson(),
        "latitud": latitud?.toJson(),
        "longitud": longitud?.toJson(),
        "localidad": localidad?.toJson(),
        "tipoUnidad": tipoUnidad?.toJson(),
        "cliente": cliente?.toJson(),
      };
}

class InmuebleId {
  InmuebleId({
    required this.value,
  });

  String value;

  factory InmuebleId.fromJson(Map<String, dynamic> json) => InmuebleId(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Descripcion {
  Descripcion({
    required this.value,
  });

  String value;

  factory Descripcion.fromJson(Map<String, dynamic> json) => Descripcion(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class FechaExclusividad {
  FechaExclusividad({
    required this.value,
  });

  String value;

  factory FechaExclusividad.fromJson(Map<String, dynamic> json) =>
      FechaExclusividad(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Calle {
  Calle({
    required this.value,
  });

  String value;

  factory Calle.fromJson(Map<String, dynamic> json) => Calle(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Edificacion {
  Edificacion({
    required this.value,
  });

  String value;

  factory Edificacion.fromJson(Map<String, dynamic> json) => Edificacion(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Piso {
  Piso({
    required this.value,
  });

  String value;

  factory Piso.fromJson(Map<String, dynamic> json) => Piso(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Departamento {
  Departamento({
    required this.value,
  });

  String value;

  factory Departamento.fromJson(Map<String, dynamic> json) => Departamento(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Latitud {
  Latitud({
    required this.value,
  });

  String value;

  factory Latitud.fromJson(Map<String, dynamic> json) => Latitud(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Longitud {
  Longitud({
    required this.value,
  });

  String value;

  factory Longitud.fromJson(Map<String, dynamic> json) => Longitud(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Altura {
  Altura({
    required this.value,
  });

  String value;

  factory Altura.fromJson(Map<String, dynamic> json) => Altura(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class ClienteEditar {
  ClienteEditar({
    required this.value,
  });

  InmuebleValue value;

  factory ClienteEditar.fromJson(Map<String, dynamic> json) => ClienteEditar(
        value: InmuebleValue.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
      };
}

class LocalidadEditar {
  LocalidadEditar({
    required this.value,
  });

  InmuebleValue value;

  factory LocalidadEditar.fromJson(Map<String, dynamic> json) =>
      LocalidadEditar(
        value: InmuebleValue.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
      };
}

class TipoUnidadEditar {
  TipoUnidadEditar({
    required this.value,
  });

  InmuebleValue value;

  factory TipoUnidadEditar.fromJson(Map<String, dynamic> json) =>
      TipoUnidadEditar(
        value: InmuebleValue.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
      };
}

class InmuebleValue {
  InmuebleValue({
    required this.rel,
    required this.href,
    required this.title,
    required this.method,
    required this.type,
  });

  String rel;
  String href;
  String title;
  String method;
  String type;

  factory InmuebleValue.fromJson(Map<String, dynamic> json) => InmuebleValue(
        rel: json["rel"],
        href: json["href"],
        title: json["title"],
        method: json["method"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel,
        "href": href,
        "title": title,
        "method": method,
        "type": type,
      };
}
