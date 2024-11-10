import 'package:flutter/material.dart';
import 'package:foody/Pages/LoginPage.dart';
import 'package:foody/Pages/RegisterPage.dart';

class Login_or_Register extends StatefulWidget {
  const Login_or_Register({super.key});

  @override
  State<Login_or_Register> createState() => _Login_or_RegisterState();
}

class _Login_or_RegisterState extends State<Login_or_Register> {
  bool showLoginPage=true;
  void togglePage(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePage);
    }else{
      return RegisterPage(onTap: togglePage);
    }
  }
}