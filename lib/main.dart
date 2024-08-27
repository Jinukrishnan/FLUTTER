import 'package:ctctbk/pages/AddContact.dart';
import 'package:ctctbk/pages/ContactHome.dart';
import 'package:ctctbk/pages/DisplayContact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => ContactHome(),
      "/add": (contact) => AddContact(),
      "/display": (context) => DisplayContact()
    },
  ));
}
