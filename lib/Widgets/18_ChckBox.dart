import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Basic Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked1 = value!;
                      });
                      print(_isChecked1);
                    },
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                  ),
                  Text('Accept Terms'),
                ],
              ),
              SizedBox(height: 20),
              // Styled CheckboxListTile
              CheckboxListTile(
                title: Text(
                  'Subscribe to Newsletter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                value: _isChecked2,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked2 = value!;
                  });
                },
                activeColor: Colors.green,
                checkColor: Colors.white,
                controlAffinity:
                    ListTileControlAffinity.leading, // Position of the checkbox
                subtitle: Text('Receive weekly updates and news'),
                secondary:
                    Icon(Icons.email), // Secondary widget next to the title
              ),
            ],
          ),
        ),
      ),
    );
  }
}
