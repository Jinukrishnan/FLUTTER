import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String? _selectedJob = "FLUTTER";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile<String>(
                activeColor: Colors.yellow,
                title: const Text('FLUTTER'),
                value: 'FLUTTER',
                groupValue: _selectedJob,
                onChanged: (String? value) {
                  setState(() {
                    _selectedJob = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('MERN'),
                value: 'MERN',
                groupValue: _selectedJob,
                onChanged: (String? value) {
                  setState(() {
                    _selectedJob = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('PHP'),
                value: 'PHP',
                groupValue: _selectedJob,
                onChanged: (String? value) {
                  setState(() {
                    _selectedJob = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('PYTHON'),
                value: 'PYTHON',
                groupValue: _selectedJob,
                onChanged: (String? value) {
                  setState(() {
                    _selectedJob = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                _selectedJob == null
                    ? 'No job selected'
                    : 'Selected job: $_selectedJob',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
