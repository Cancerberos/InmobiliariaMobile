// To parse this JSON data, do
//
//     final avisos = avisosFromJson(jsonString);

import 'dart:convert';

import 'estado_aviso_model.dart';

List<AvisoMock> avisosMockFromJson(String str) =>
    List<AvisoMock>.from(json.decode(str).map((x) => AvisoMock.fromJson(x)));

String avisosToJson(List<AvisoMock> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvisoMock {
  AvisoMock({
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
  final InmuebleMock inmueble;
  final String valor;
  final ProvinciaMock tipoOperacion;
  final String fechaInicio;
  final String fechaFin;
  final EstadoAvisoMock estadoAviso;

  factory AvisoMock.fromJson(Map<String, dynamic> json) => AvisoMock(
        id: json["id"],
        descripcion: json["descripcion"],
        inmueble: InmuebleMock.fromJson(json["inmueble"]),
        valor: json["valor"],
        tipoOperacion: ProvinciaMock.fromJson(json["tipoOperacion"]),
        fechaInicio: json["fechaInicio"],
        fechaFin: json["fechaFin"],
        estadoAviso: EstadoAvisoMock.fromJson(json["estadoAviso"]),
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

class ProvinciaMock {
  ProvinciaMock({
    required this.id,
    required this.descripcion,
  });

  final String id;
  final String descripcion;

  factory ProvinciaMock.fromJson(Map<String, dynamic> json) => ProvinciaMock(
        id: json["id"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
      };
}

class EstadoAvisoMock {
  EstadoAvisoMock({
    required this.descripcion,
    required this.id,
  });

  final String descripcion;
  final String id;

  factory EstadoAvisoMock.fromJson(Map<String, dynamic> json) =>
      EstadoAvisoMock(
        descripcion: json["descripcion"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "id": id,
      };
}

class InmuebleMock {
  InmuebleMock({
    required this.id,
    required this.imagen,
    required this.cliente,
    required this.descripcion,
    required this.fechaExclusividad,
    required this.tipoUnidad,
    required this.direccion,
  });

  final String id;
  final List<ImagenMock> imagen;
  final ClienteMock cliente;
  final String descripcion;
  final String fechaExclusividad;
  final String tipoUnidad;
  final DireccionMock direccion;

  factory InmuebleMock.fromJson(Map<String, dynamic> json) => InmuebleMock(
        id: json["id"],
        imagen: List<ImagenMock>.from(
            json["imagen"].map((x) => ImagenMock.fromJson(x))),
        cliente: ClienteMock.fromJson(json["cliente"]),
        descripcion: json["descripcion"],
        fechaExclusividad: json["fechaExclusividad"],
        tipoUnidad: json["tipoUnidad"],
        direccion: DireccionMock.fromJson(json["direccion"]),
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

class ClienteMock {
  ClienteMock({
    required this.id,
    required this.direccion,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
  });

  final String id;
  final DireccionMock direccion;
  final String nombre;
  final String apellido;
  final String email;
  final String telefono;

  factory ClienteMock.fromJson(Map<String, dynamic> json) => ClienteMock(
        id: json["id"],
        direccion: DireccionMock.fromJson(json["direccion"]),
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

class DireccionMock {
  DireccionMock({
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
  final LocalidadMock localidad;
  final String numero;
  final String edificacion;
  final String piso;
  final String departamento;
  final String latitud;
  final String longitud;

  factory DireccionMock.fromJson(Map<String, dynamic> json) => DireccionMock(
        id: json["id"],
        localidad: LocalidadMock.fromJson(json["localidad"]),
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

class LocalidadMock {
  LocalidadMock({
    required this.id,
    required this.provincia,
    required this.descripcion,
    required this.codigoPostal,
  });

  final String id;
  final ProvinciaMock provincia;
  final String descripcion;
  final String codigoPostal;

  factory LocalidadMock.fromJson(Map<String, dynamic> json) => LocalidadMock(
        id: json["id"],
        provincia: ProvinciaMock.fromJson(json["provincia"]),
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

class ImagenMock {
  ImagenMock({
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

  factory ImagenMock.fromJson(Map<String, dynamic> json) => ImagenMock(
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
