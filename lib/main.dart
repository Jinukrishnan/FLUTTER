import 'package:firebasetodo/AddTodo.dart';
import 'package:firebasetodo/ListTodo.dart';
import 'package:firebasetodo/UpdateTodo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    '/':(context)=>ListTodo(),
    '/add':(context)=>AddTodo(),
    '/update':(context)=>UpdateTodo(),
  },
));
}
