import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  const Containers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Container",
      home: Scaffold(
        body: Container(
          width: 150,
          height: 150,
          // color: Colors.red,
          // text align
          child: Text("container"),
          alignment: Alignment.center,
          // margin and padding
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          // decoration
          decoration: BoxDecoration(
              color: Colors.yellow,
              // border radius
              borderRadius: BorderRadius.circular(10),
              // box shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(5, 5),
                ),
              ],
              // linear gradient
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
      ),
    );
  }
}
