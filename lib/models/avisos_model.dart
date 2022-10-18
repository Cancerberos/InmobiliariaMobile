// To parse this JSON data, do
//
//     final avisos = avisosFromJson(jsonString);

import 'dart:convert';

import 'estado_aviso_model.dart';

List<Aviso> avisosFromJson(String str) =>
    List<Aviso>.from(json.decode(str).map((x) => Aviso.fromJson(x)));

String avisosToJson(List<Aviso> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aviso {
  Aviso({
    required this.id,
    required this.descripcion,
    required this.inmueble,
    required this.valor,
    required this.tipoOperacion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estadoAviso,
  });

  final String id;
  final String descripcion;
  final Inmueble inmueble;
  final String valor;
  final Provincia tipoOperacion;
  final String fechaInicio;
  final String fechaFin;
  final EstadoAviso estadoAviso;

  factory Aviso.fromJson(Map<String, dynamic> json) => Aviso(
        id: json["id"],
        descripcion: json["descripcion"],
        inmueble: Inmueble.fromJson(json["inmueble"]),
        valor: json["valor"],
        tipoOperacion: Provincia.fromJson(json["tipoOperacion"]),
        fechaInicio: json["fechaInicio"],
        fechaFin: json["fechaFin"],
        estadoAviso: EstadoAviso.fromJson(json["estadoAviso"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "inmueble": inmueble.toJson(),
        "valor": valor,
        "tipoOperacion": tipoOperacion.toJson(),
        "fechaInicio": fechaInicio,
        "fechaFin": fechaFin,
        "estadoAviso": estadoAviso.toJson(),
      };
}

class Provincia {
  Provincia({
    required this.id,
    required this.descripcion,
  });

  final String id;
  final String descripcion;

  factory Provincia.fromJson(Map<String, dynamic> json) => Provincia(
        id: json["id"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
      };
}

class Inmueble {
  Inmueble({
    required this.id,
    required this.imagen,
    required this.cliente,
    required this.descripcion,
    required this.fechaExclusividad,
    required this.tipoUnidad,
    required this.direccion,
  });

  final String id;
  final List<Imagen> imagen;
  final Cliente cliente;
  final String descripcion;
  final String fechaExclusividad;
  final String tipoUnidad;
  final Direccion direccion;

  factory Inmueble.fromJson(Map<String, dynamic> json) => Inmueble(
        id: json["id"],
        imagen:
            List<Imagen>.from(json["imagen"].map((x) => Imagen.fromJson(x))),
        cliente: Cliente.fromJson(json["cliente"]),
        descripcion: json["descripcion"],
        fechaExclusividad: json["fechaExclusividad"],
        tipoUnidad: json["tipoUnidad"],
        direccion: Direccion.fromJson(json["direccion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagen": List<dynamic>.from(imagen.map((x) => x.toJson())),
        "cliente": cliente.toJson(),
        "descripcion": descripcion,
        "fechaExclusividad": fechaExclusividad,
        "tipoUnidad": tipoUnidad,
        "direccion": direccion.toJson(),
      };
}

class Cliente {
  Cliente({
    required this.id,
    required this.direccion,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
  });

  final String id;
  final Direccion direccion;
  final String nombre;
  final String apellido;
  final String email;
  final String telefono;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        direccion: Direccion.fromJson(json["direccion"]),
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "direccion": direccion.toJson(),
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "telefono": telefono,
      };
}

class Direccion {
  Direccion({
    required this.id,
    required this.localidad,
    required this.numero,
    required this.edificacion,
    required this.piso,
    required this.departamento,
    required this.latitud,
    required this.longitud,
  });

  final String id;
  final Localidad localidad;
  final String numero;
  final String edificacion;
  final String piso;
  final String departamento;
  final String latitud;
  final String longitud;

  factory Direccion.fromJson(Map<String, dynamic> json) => Direccion(
        id: json["id"],
        localidad: Localidad.fromJson(json["localidad"]),
        numero: json["numero"],
        edificacion: json["edificacion"],
        piso: json["piso"],
        departamento: json["departamento"],
        latitud: json["latitud"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "localidad": localidad.toJson(),
        "numero": numero,
        "edificacion": edificacion,
        "piso": piso,
        "departamento": departamento,
        "latitud": latitud,
        "longitud": longitud,
      };
}

class Localidad {
  Localidad({
    required this.id,
    required this.provincia,
    required this.descripcion,
    required this.codigoPostal,
  });

  final String id;
  final Provincia provincia;
  final String descripcion;
  final String codigoPostal;

  factory Localidad.fromJson(Map<String, dynamic> json) => Localidad(
        id: json["id"],
        provincia: Provincia.fromJson(json["provincia"]),
        descripcion: json["descripcion"],
        codigoPostal: json["codigoPostal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "provincia": provincia.toJson(),
        "descripcion": descripcion,
        "codigoPostal": codigoPostal,
      };
}

class Imagen {
  Imagen({
    required this.id,
    required this.descripcion,
    required this.inmuebleId,
    required this.name,
    required this.mimetype,
    required this.bytes,
  });

  final String id;
  final String descripcion;
  final String inmuebleId;
  final String name;
  final String mimetype;
  final String bytes;

  factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        id: json["id"],
        descripcion: json["descripcion"],
        inmuebleId: json["inmueble_id"],
        name: json["name"],
        mimetype: json["mimetype"],
        bytes: json["bytes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "inmueble_id": inmuebleId,
        "name": name,
        "mimetype": mimetype,
        "bytes": bytes,
      };
}
