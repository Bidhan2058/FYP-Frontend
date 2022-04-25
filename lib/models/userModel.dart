import 'dart:convert';

UserProfile infofromJson(String str) => UserProfile.fromJson(json.decode(str));

String infoToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  List<UserData> data;

  UserProfile({this.data});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        data:
            List<UserData>.from(json["users"].map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserData {
  String id;
  String fullname;
  String mail;
  String contact;
  String password;
  String address;
  String username;

  UserData(
      {this.id,
      this.fullname,
      this.mail,
      this.contact,
      this.password,
      this.address,
      this.username});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    fullname = json['fullname'];
    mail = json['mail'];
    contact = json['contact'];
    password = json['password'];
    address = json['address'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.fullname;
    data['email'] = this.mail;
    data['contact'] = this.contact;
    data['password'] = this.password;
    data['address'] = this.address;
    data['username'] = this.username;
    return data;
  }
}