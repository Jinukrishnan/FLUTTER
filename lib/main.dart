import 'package:flutter/material.dart';
import 'package:httpfakeapi/Details.dart';
import 'package:httpfakeapi/Home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/details": (context) => Details(),
    },
  ));
}
