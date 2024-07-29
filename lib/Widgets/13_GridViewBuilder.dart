import 'package:flutter/material.dart';

class GridViewBuilderWidget extends StatelessWidget {
  GridViewBuilderWidget({super.key});
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
          child: GridView.builder(
            itemCount: _post.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("${_post[index]["name"]}"),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
