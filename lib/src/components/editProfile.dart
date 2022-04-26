// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/components/userProfile.dart';
// import 'package:flutter_login_signup/src/loginPage.dart';
// import 'package:flutter_login_signup/src/welcomePage.dart';
import 'package:flutter_login_signup/models/registermodel.dart';
import 'package:flutter_session/flutter_session.dart';

// import 'package:flutter_login_signup/src/loginPage.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  RegisterModel regmodel = RegisterModel();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(228, 100, 136, 245)),
      body: Form(
          key: globalFormKey,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                   Color.fromARGB(228, 100, 136, 245),
                Color.fromRGBO(105, 221, 181, 1)
                  ])),
              child: ListView(
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    height: 105,
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      style: TextStyle(fontSize: 19),
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      validator: (input) => !(input.length > 3)
                          ? "Plese provide valid name"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle:
                              TextStyle(fontSize: 19.0, color: Colors.black),
                          fillColor: Color(0x00000000),
                          filled: true,
                          errorStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      style: TextStyle(fontSize: 19),
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      validator: (input) => !(input.length > 3)
                          ? "Plese provide valid username"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle:
                              TextStyle(fontSize: 19.0, color: Colors.black),
                          fillColor: Color(0x00000000),
                          filled: true,
                          errorStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      style: TextStyle(fontSize: 19),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) =>
                          !input.contains("@") ? "Email should be valid" : null,
                      decoration: InputDecoration(
                          errorStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(fontSize: 19.0, color: Colors.black),
                          fillColor: Color(0x00000000),
                          filled: true),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(fontSize: 19),
                      controller: contactController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Contact No',
                          labelStyle:
                              TextStyle(fontSize: 19.0, color: Colors.black),
                          fillColor: Color(0x00000000),
                          filled: true),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      style: TextStyle(fontSize: 19),
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      validator: (input) => !(input.length > 3)
                          ? "Plese provide valid password"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'New Password',
                          labelStyle:
                              TextStyle(fontSize: 19.0, color: Colors.black),
                          fillColor: Color(0x00000000),
                          filled: true,
                          errorStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      style: TextStyle(fontSize: 19),
                      controller: passwordConfirmController,
                      keyboardType: TextInputType.text,
                      validator: (input) => !(input == passwordController.text.trim())
                          ? "Password donot match"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle:
                              TextStyle(fontSize: 19.0, color: Colors.black),
                          fillColor: Color(0x00000000),
                          filled: true,
                          errorStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      style: TextStyle(fontSize: 19),
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      validator: (input) => !(input.length > 3)
                          ? "Plese provide valid address"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle:
                              TextStyle(fontSize: 19.0, color: Colors.black),
                          fillColor: Color(0x00000000),
                          filled: true,
                          errorStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                      child: RaisedButton(
                          textColor: Colors.white,
                          color: Color.fromRGBO(239, 108, 0, 0.9),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 23),
                          ),
                          onPressed: () {
                            validate();
                            print(emailController.text);
                          })),
                ],
              ))),
    );
  }

  void sendregdata() async {
    regmodel = RegisterModel(
        mail: emailController.text.trim(),
        fullname: nameController.text.trim(),
        address: addressController.text.trim(),
        username : usernameController.text.trim(),
        password: passwordController.text.trim(),
        contact: contactController.text.trim());
    var userId = await FlutterSession().get('id');
    var response = await http.put("http://10.0.2.2:8000/API/editProfile/$userId",
        headers: {"Content-type": "application/json"},
        body: json.encode(regmodel.toJson()));
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileEightPage()));
    } else {
      print(response);
    }
  }

  bool validate() {
    final form = globalFormKey.currentState;
    //If form is valid then it returns true
    if (form.validate()) {
      sendregdata();
      return true;
    }
    return false;
  }
}