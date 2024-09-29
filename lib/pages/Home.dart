import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Box credentialBox = Hive.box("Auth");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
              onPressed: () {
                credentialBox.delete("Auth");
                Navigator.pushReplacementNamed(context, "/signin");
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Text("home"),
    );
  }
}
