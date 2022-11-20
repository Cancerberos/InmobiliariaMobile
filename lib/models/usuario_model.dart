import 'dart:convert';

UsuarioModel usuarioFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.apellido,
    this.email,
    this.nombre,
    this.telefono,
    this.username,
    this.password,
    this.esAdmin,
    this.logicalTypeName,
    this.objectIdentifier,
    this.datanucleusVersionLong,
    this.datanucleusVersionTimestamp,
  });

  final String? apellido;
  final String? email;
  final String? nombre;
  final String? telefono;
  final String? username;
  final String? password;
  final bool? esAdmin;
  final String? logicalTypeName;
  final String? objectIdentifier;
  final int? datanucleusVersionLong;
  final int? datanucleusVersionTimestamp;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        apellido: json["apellido"],
        email: json["email"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        username: json["username"],
        password: json["password"],
        esAdmin: json["esAdmin"],
        logicalTypeName: json["logicalTypeName"],
        objectIdentifier: json["objectIdentifier"],
        datanucleusVersionLong: json["datanucleusVersionLong"],
        datanucleusVersionTimestamp: json["datanucleusVersionTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "apellido": apellido,
        "email": email,
        "nombre": nombre,
        "telefono": telefono,
        "username": username,
        "password": password,
        "esAdmin": esAdmin,
        "logicalTypeName": logicalTypeName,
        "objectIdentifier": objectIdentifier,
        "datanucleusVersionLong": datanucleusVersionLong,
        "datanucleusVersionTimestamp": datanucleusVersionTimestamp,
      };
}
