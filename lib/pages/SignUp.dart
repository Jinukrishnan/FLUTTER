import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passwordhashing/pages/SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Box credentialBox = Hive.box("Auth");
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();

  void signIn() {
    // if (_userName.text != null && _password != null) {
    var _hashedPassword = hashedPassowrd(_password.text);
    Map user = {"username": _userName.text, "password": _hashedPassword};
    credentialBox.put("Auth", jsonEncode(user));
    print(credentialBox.get("Auth"));
    Navigator.pushNamed(context, "/signin");
    // }
  }

// hash the pssword
  String hashedPassowrd(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // user name
              TextField(
                controller: _userName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "User Name",
                ),
                // keyboardType: ,
              ),
              SizedBox(height: 30),
              //password
              TextField(
                controller: _password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: signIn, child: Text("Sign Up")),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/signin");
                },
                child: Text(
                  "Click here to  Login",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
