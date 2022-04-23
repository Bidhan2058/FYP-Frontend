class Model {
  String mail;
  String password;
  Model({this.mail, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'mail': mail.trim(),
      'password': password.trim(),
    };

    return map;
  }
}

class LoginResponseModel {
  final String id;
  final String name;
  final String token;
  final String error;

  LoginResponseModel({this.id, this.name, this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json["id"] != null ? json["id"] : "",
      name: json["name"] != null ? json["name"] : "",
      token: json["token"] != null ? json["token"] : "",
      error: json["message"] != null ? json["message"] : "",
    );
  }
}
