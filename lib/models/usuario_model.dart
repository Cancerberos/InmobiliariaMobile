class UsuarioModel {
  String? user;
  String? password;

  UsuarioModel({
    this.user,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['USER'] = user;
    data['PASS'] = password;
    return data;
  }
}
