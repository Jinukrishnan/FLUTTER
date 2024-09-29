import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Box credentialBox = Hive.box("Auth");
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();

  void signIn() {
    Map<dynamic, dynamic> Auth = jsonDecode(credentialBox.get("Auth"));
    print("===================signin=========================");
    if (Auth["password"] == hashedPassowrd(_password.text) &&
        Auth["username"] == _userName.text) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      print("invalid login");
    }
  }

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
              ElevatedButton(onPressed: signIn, child: Text("Sign In")),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/signup");
                },
                child: Text(
                  "Create Account",
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
