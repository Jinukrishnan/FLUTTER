import 'package:apps/Apps/12_HiveTODO/pages/DialogueBox.dart';
import 'package:apps/Apps/12_HiveTODO/pages/ToDoList.dart';
import 'package:flutter/material.dart';

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  TextEditingController _controller = TextEditingController();
  final List<List<dynamic>> todos = [
    ["Drink", true],
    ["Sleep", false],
    ["Walk", true],
    ["Work", false],
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void onSave() {
    setState(() {
      todos.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void onDelete(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            onSave: onSave,
            onCancel: onCancel,
          );
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
                onDelete: (context) => onDelete(index),
                taskName: todos[index][0],
                taskCompleted: todos[index][1],
                onChange: (value) => checkBoxChanged(value, index));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        hoverColor: Colors.yellow[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
