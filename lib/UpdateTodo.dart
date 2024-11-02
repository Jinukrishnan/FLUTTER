import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({super.key});

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  TextEditingController task = TextEditingController();
   final CollectionReference todo =
      FirebaseFirestore.instance.collection("todos");
void updateTask(id){
  todo.doc(id).update({'task':task.text});
}
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map<dynamic,dynamic>;
    task.text=args['task'];
    final id=args['id'];
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
              onPressed: ()=>updateTask(id),
              child: Text("Add"),
            )
          ],
        ),
      )),
    );
  }
}