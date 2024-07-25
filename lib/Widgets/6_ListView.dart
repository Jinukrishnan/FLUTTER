import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              // named parameters
              scrollDirection: Axis.vertical,
              reverse: true,
              padding: EdgeInsets.all(20),
              // -----------------
              children: [
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.green,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.yellow,
                  child: Center(
                    child: Text("2"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.red,
                  child: Center(
                    child: Text("3"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.blue,
                  child: Center(
                    child: Text("4"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.green,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.yellow,
                  child: Center(
                    child: Text("2"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.red,
                  child: Center(
                    child: Text("3"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.blue,
                  child: Center(
                    child: Text("4"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.green,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.yellow,
                  child: Center(
                    child: Text("2"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.red,
                  child: Center(
                    child: Text("3"),
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  color: Colors.blue,
                  child: Center(
                    child: Text("4"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
