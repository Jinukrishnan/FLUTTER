import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayContact extends StatefulWidget {
  const DisplayContact({super.key});

  @override
  State<DisplayContact> createState() => _DisplayContactState();
}

class _DisplayContactState extends State<DisplayContact> {
  int? index;
  Map<dynamic, dynamic>? data;
  List<dynamic>? contacts;
  Uint8List? _image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await prefs.getString('contacts');

    setState(() {
      contacts = json.decode(res!);
      _image = base64Decode(contacts![index!]["profile"]);
    });

    print(contacts![index!]["profile"]);
  }

  @override
  Widget build(BuildContext context) {
    index = int.parse(ModalRoute.of(context)!.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Contact"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: _image != null
                  ? Image.memory(
                      _image!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          "No image",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
            ),
            Divider(),
            Row(
              children: [
                Text("Name"),
                Text(contacts![index!]["fname"]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
