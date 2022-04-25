class RegisterModel {
  String fullname;
  String password;
  String passwordconfirm;
  String mail;
  String contact;
  String address;
  String username;

  // String xyz;
  RegisterModel(
      {this.fullname,
      this.password,
      this.passwordconfirm,
      this.mail,
      this.contact,
      this.address,
      this.username,
     });
  // factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  _$ModelToJson(RegisterModel instance) => <String, dynamic>{
        'fullname': instance.fullname,
        'password': instance.password,
        'passwordconfirm': instance.passwordconfirm,
        'mail': instance.mail,
        'contact': instance.contact,
        'address': instance.address,
        'username': instance.username,
      };
}
// Model _$ModelFromJson(Map<String, dynamic> json) {
//   return Model(
//     mail: json['fullname'] as String,
//     password: json['contactnumber'] as String,
//   );
// }