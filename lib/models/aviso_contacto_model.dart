import 'dart:convert';
import 'models.dart';

List<AvisoContacto> avisoContactoFromJson(String str) =>
    List<AvisoContacto>.from(
        json.decode(str).map((x) => AvisoContacto.fromJson(x)));

String avisoContactoToJson(List<AvisoContacto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvisoContacto {
  AvisoContacto({
    required this.apellido,
    required this.email,
    required this.mensaje,
    required this.mombre,
    required this.aviso,
    required this.estadoContacto,
  });

  final String? apellido;
  final String? email;
  final String? mensaje;
  final String? mombre;
  final Aviso? aviso;
  final AvisoContacto? estadoContacto;

  factory AvisoContacto.fromJson(Map<String, dynamic> json) => AvisoContacto(
        apellido: json["apellido"],
        email: json["email"],
        mensaje: json["mensaje"],
        mombre: json["mombre"],
        aviso: Aviso.fromJson(json["aviso"]),
        estadoContacto: AvisoContacto.fromJson(json["estadoContacto"]),
      );

  Map<String, dynamic> toJson() => {
        "apellido": apellido,
        "email": email,
        "mensaje": mensaje,
        "mombre": mombre,
        "aviso": aviso?.toJson(),
        "estadoContacto": estadoContacto?.toJson(),
      };
}
