import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactHome extends StatefulWidget {
  const ContactHome({super.key});

  @override
  State<ContactHome> createState() => _ContactHomeState();
}

class _ContactHomeState extends State<ContactHome> {
  List<dynamic> _contacts=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadImage();
  }

  void _loadImage() async {

    // final prefs = await SharedPreferences.getInstance();
    // final res = await prefs.getString('contacts');
    // print(res);

    // setState(() {
    //   _contacts = json.decode(res!);
    //   print(_contacts);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
          return ListTile(
            contentPadding: EdgeInsets.all(20),
            title: Text("data"),
            trailing: Icon(Icons.more_vert),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
