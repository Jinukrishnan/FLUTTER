import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController task = TextEditingController();
  final CollectionReference todo =
      FirebaseFirestore.instance.collection("todos");
  void addTask() {
todo.add({'task':task.text});
    print("hai");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Todos"),
      ),
      body: Expanded(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textAlign: TextAlign.center,
              controller: task,
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: addTask,
              child: Text("Add"),
            )
          ],
        ),
      )),
    );
  }
}
