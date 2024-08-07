import 'package:apps/Apps/12_HiveTODO/pages/ToDoList.dart';
import 'package:flutter/material.dart';

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  final List<Map<dynamic, dynamic>> todos = [
    {"taskName": "Drink", "taskCompleted": true},
    {"taskName": "Sleep", "taskCompleted": false},
    {"taskName": "Run", "taskCompleted": true},
    {"taskName": "Read", "taskCompleted": false},
    {"taskName": "Drink", "taskCompleted": true},
    {"taskName": "Sleep", "taskCompleted": false},
    {"taskName": "Run", "taskCompleted": true},
    {"taskName": "Read", "taskCompleted": false},
    {"taskName": "Drink", "taskCompleted": true},
    {"taskName": "Sleep", "taskCompleted": false},
    {"taskName": "Run", "taskCompleted": true},
    {"taskName": "Read", "taskCompleted": false},
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todos[index]["taskCompleted"] = !todos[index]["taskCompleted"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
            child: Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ToDoList(
                taskName: todos[index]["taskName"],
                taskCompleted: todos[index]["taskCompleted"],
                onChange: (value) => checkBoxChanged(value, index));
          }),
    );
  }
}
