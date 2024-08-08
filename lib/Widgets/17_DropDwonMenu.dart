import 'package:flutter/material.dart';

class DropDwonMenuWidget extends StatefulWidget {
  const DropDwonMenuWidget({super.key});

  @override
  State<DropDwonMenuWidget> createState() => _DropDwonMenuWidgetState();
}

class _DropDwonMenuWidgetState extends State<DropDwonMenuWidget> {
  // Define the selected value and the list of items
  String? _selectedJob;
  final List<String> _jobs = [
    "FLUTTER",
    "MERN",
    "PHP",
    "PYTHON",
    "JAVA",
    "C++",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                  icon: Icon(Icons.filter),
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  dropdownColor: Colors.yellow,
                  elevation: 100,
                  // autofocus: false,
                  // focusColor: Colors.green,
                  isExpanded: true,
                  isDense: true,
                  underline: Container(
                    height: 0,
                  ),
                  // alignment: Alignment.center,
                  borderRadius: BorderRadius.circular(20),
                  value: _selectedJob,
                  hint: Text("Select Job"),
                  items: _jobs.map((String job) {
                    return DropdownMenuItem<String>(
                      value: job,
                      child: Text(job),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedJob = value;
                    });
                  }),
              Text(_selectedJob == null
                  ? 'Job Not Selected '
                  : '$_selectedJob is selected'),
            ],
          ),
        ),
      ),
    );
  }
}
