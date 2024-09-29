import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passwordhashing/pages/Home.dart';
import 'package:passwordhashing/pages/SignIn.dart';
import 'package:passwordhashing/pages/SignUp.dart';

class Validatepage extends StatefulWidget {
  const Validatepage({super.key});

  @override
  State<Validatepage> createState() => _ValidatepageState();
}

class _ValidatepageState extends State<Validatepage> {
  final Box credentialBox = Hive.box("Auth");
  bool _signIn = false;
  String? Auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Auth = credentialBox.get("Auth");
    setState(() {
      if (Auth != null) {
        _signIn = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: _signIn ? "/home" : "/signin",
      routes: {
        "/signin": (context) => SignIn(),
        "/signup": (context) => SignUp(),
        "/home": (context) => Home(),
      },
    );
  }
}
