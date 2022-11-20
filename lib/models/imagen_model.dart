class Imagen {
  Imagen({
    this.descripcion,
    this.url,
    this.logicalTypeName,
    this.objectIdentifier,
    this.datanucleusVersionLong,
    this.datanucleusVersionTimestamp,
  });

  final String? descripcion;
  final String? url;
  final String? logicalTypeName;
  final String? objectIdentifier;
  final int? datanucleusVersionLong;
  final int? datanucleusVersionTimestamp;

  factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        descripcion: json["descripcion"],
        url: json["url"],
        logicalTypeName: json["logicalTypeName"],
        objectIdentifier: json["objectIdentifier"],
        datanucleusVersionLong: json["datanucleusVersionLong"],
        datanucleusVersionTimestamp: json["datanucleusVersionTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "url": url,
        "logicalTypeName": logicalTypeName,
        "objectIdentifier": objectIdentifier,
        "datanucleusVersionLong": datanucleusVersionLong,
        "datanucleusVersionTimestamp": datanucleusVersionTimestamp,
      };
}
