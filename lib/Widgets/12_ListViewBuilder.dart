import 'package:flutter/material.dart';

class ListViewBuilderWidget extends StatelessWidget {
  ListViewBuilderWidget({super.key});
  final List<Map<dynamic, dynamic>> _post = [
    {"name": "alan", "age": 17, "class": 12},
    {"name": "alan", "age": 17, "class": 12},
    {"name": "alan", "age": 17, "class": 12},
    {"name": "alan", "age": 17, "class": 12},
    {"name": "alan", "age": 17, "class": 12},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.deepPurple,
          child: ListView.builder(
            itemCount: _post.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_post[index]["name"]),
                subtitle: Text("${_post[index]["mark"]}"),
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
