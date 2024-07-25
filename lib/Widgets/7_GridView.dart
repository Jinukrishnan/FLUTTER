import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.grey,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            // named parameter
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                color: Colors.green,
                child: Center(
                  child: Text("1"),
                ),
              ),
              Container(
                color: Colors.yellow,
                child: Center(
                  child: Text("2"),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text("4"),
                ),
              ),
              Container(
                color: Colors.red,
                child: Center(
                  child: Text("5"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
