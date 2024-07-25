import 'package:flutter/material.dart';

class ButtonNeumorphism extends StatefulWidget {
  const ButtonNeumorphism({super.key});

  @override
  State<ButtonNeumorphism> createState() => _ButtonNeumorphismState();
}

class _ButtonNeumorphismState extends State<ButtonNeumorphism> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: darkMode ? Colors.grey[900] : Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Icon(
                  Icons.android,
                  size: 80,
                  color: darkMode ? Colors.white : Colors.grey[900],
                ),
                decoration: BoxDecoration(
                  // color: Colors.green,
                  color: darkMode ? Colors.grey[900] : Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: darkMode ? Colors.black26 : Colors.black12,
                        offset: Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 1),
                    BoxShadow(
                        color: darkMode ? Colors.black26 : Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 15,
                        spreadRadius: 1),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            darkMode = true;
                          });
                        },
                        child: Text("Dark Mode"),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            backgroundColor: Colors.grey[900],
                            foregroundColor: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            darkMode = false;
                          });
                        },
                        child: Text("Light Mode"),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey[900]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
