import 'package:flutter/material.dart';

class ArrayTodo extends StatefulWidget {
  const ArrayTodo({super.key});

  @override
  State<ArrayTodo> createState() => _ArrayTodoState();
}

class _ArrayTodoState extends State<ArrayTodo> {
  TextEditingController _controller = TextEditingController();
  List<String> Todos = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter text',
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Space between TextField and Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    onPressed: () {
                      // Define your button action here
                      setState(() {
                        Todos.add(_controller.text);
                        _controller.clear();
                      });
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.grey,
              child: ListView.builder(
                  itemCount: Todos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Todos[index]),
                          IconButton(
                              onPressed: () {
                                print(index);
                                setState(() {
                                  Todos.remove(Todos[index]);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red[900],
                              ))
                        ],
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
