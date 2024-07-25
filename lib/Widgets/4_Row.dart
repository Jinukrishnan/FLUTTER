import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.grey,
          width: MediaQuery.of(context).size.width,
          height: double.infinity * .5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Center(child: Text("1")),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
                child: Center(child: Text("2")),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Center(child: Text("3")),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text("4")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
