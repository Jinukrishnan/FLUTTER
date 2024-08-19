import 'package:apps/Apps/17_HiveTODO/pages/DialogueBox.dart';
import 'package:apps/Apps/17_HiveTODO/pages/ToDoList.dart';
import 'package:apps/Apps/17_HiveTODO/pages/TodoDatabase.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  TodoDatabase db = TodoDatabase();
  TextEditingController _controller = TextEditingController();
  // final List<List<dynamic>> todos = [
  //   ["Drink", true],
  //   ["Sleep", false],
  //   ["Walk", true],
  //   ["Work", false],
  // ];
  final _myBox = Hive.box("myBox");
  @override
  void initState() {
    // TODO: implement initState
    // if (_myBox.get("Todos") == null) {
    //   db.createInitialData();
    // } else {
    //   db.loadData();
    // }
    if (_myBox.get("Todos") != null) {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todos[index][1] = !db.todos[index][1];
    });
    db.updateDatabase();
  }

  void onSave() {
    setState(() {
      db.todos.add([_controller.text, false]);
      db.updateDatabase();
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void onDelete(int index) {
    setState(() {
      db.todos.removeAt(index);
      db.updateDatabase();
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
          itemCount: db.todos.length,
          itemBuilder: (context, index) {
            return ToDoList(
                onDelete: (context) => onDelete(index),
                taskName: db.todos[index][0],
                taskCompleted: db.todos[index][1],
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
