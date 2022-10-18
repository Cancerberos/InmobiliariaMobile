class DatosSesionModel {
  String? token;
  String? idCliente;

  DatosSesionModel({
    this.token,
    this.idCliente,
  });

  DatosSesionModel.fromJson(Map<String, dynamic> json) {
    token = json['TOKEN'];
    idCliente = json['ID_CLIENTE'];
  }
}
