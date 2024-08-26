import 'package:contactbook/AddContact.dart';
import 'package:contactbook/ContactHome.dart';
import 'package:contactbook/DisplayContact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      '/home': (contex) => ContactHome(),
      '/add': (contex) => AddContact(),
      '/display': (contex) => DisplayContact(),
    },
  ));
}
