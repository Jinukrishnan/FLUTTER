import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // ===========================================
              // Elevated button
              ElevatedButton(
                onPressed: () {},
                child: Text("Elevated Button"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 3,
                  textStyle: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // =====================================================
              // Text button
              TextButton(
                onPressed: () {},
                child: Text("Text button"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    elevation: 3,
                    shadowColor: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
              // ===========================================
              // Outlined Button
              OutlinedButton(
                onPressed: () {},
                child: Text("OutLine Button"),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.yellow, width: 5),
                    backgroundColor: Colors.blue[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    elevation: 10,
                    shadowColor: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
              // ===========================================
              // ICON Button
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
                style: IconButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(20)),
              )
              // ===========================================
            ],
          ),
        ),
      ),
    );
  }
}
