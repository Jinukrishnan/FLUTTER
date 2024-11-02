import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({super.key});

  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  List<DocumentSnapshot> _data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("todos").get();
    setState(() {
      _data = snapshot.docs;
    });
  }
  // delete todo

  Future<void>  dleteTodo(id) async 
{
  await FirebaseFirestore.instance.collection("todos").doc(id).delete();
  fetchData();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Todos"),
      ),
      body: Builder(builder: (BuildContext context) {
        if (_data.isEmpty) {
          return CircularProgressIndicator();
        }
        return ListView(
          children: _data.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return ListTile(
              title: Text(data['task']),
              onLongPress: (){
                Navigator.pushNamed(context, '/update',arguments: {
                  'id':doc.id,
                  'task':data['task']
                });
              },
              // Delete item
              trailing: IconButton(
                  onPressed: () async{

                    await dleteTodo(doc.id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Deletd")));

                  }, icon: Icon(Icons.delete)),
            );
          }).toList(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
    );
  }
}
