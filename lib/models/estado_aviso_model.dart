class EstadoAviso {
  EstadoAviso({
    required this.id,
    required this.descripcion,
  });

  final String id;
  final String descripcion;

  factory EstadoAviso.fromJson(Map<String, dynamic> json) => EstadoAviso(
        id: json["id"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
      };
}
