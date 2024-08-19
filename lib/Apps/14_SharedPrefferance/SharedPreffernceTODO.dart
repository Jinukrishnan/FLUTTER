import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreffernceTODO extends StatefulWidget {
  const SharedPreffernceTODO({super.key});

  @override
  State<SharedPreffernceTODO> createState() => _SharedPreffernceTODOState();
}

class _SharedPreffernceTODOState extends State<SharedPreffernceTODO> {
  TextEditingController _controller = TextEditingController();
  List<dynamic> tasks = [];

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    print("init state");
    final res = await prefs.getString('tasks');
    setState(() {
      tasks = json.decode(res!);
      print(tasks);
    });
  }

  void addTask(BuildContext context) async {
    print(_controller.text);
    final prefs = await SharedPreferences.getInstance();
    final res = await prefs.getString('tasks');

    if (_controller.text != "") {
      if (res != null) {
        List<dynamic> _tasks = json.decode(res);
        _tasks.add(_controller.text);
        await prefs.setString('tasks', json.encode(_tasks));
        print("success1");
      } else {
        List<dynamic> _tasks = [_controller.text];
        await prefs.setString('tasks', json.encode(_tasks));
        print("success2");
      }
      setState(() {
        _controller.text = "";
      });
      getTasks();
    } else {
      var alert = AlertDialog(
        title: Text("Alert"),
        content: Text("Please fill the input field"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"))
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }

  void deleteTak(index) async {
    final prefs = await SharedPreferences.getInstance();

    print(index);
    tasks.remove(tasks[index]);
    await prefs.setString('tasks', json.encode(tasks));
    getTasks();
  }

  Widget build(BuildContext context) {
    // @override

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Add Task ",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),

                        // gapPadding: ,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shadowColor: Colors.grey,
                      elevation: 5,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      addTask(context);
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Tasks",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onLongPress: () {
                        print("object");
                        setState(() {
                          _controller.text = tasks[index];
                        });
                      },
                      title: Text(tasks[index].toString()),
                      trailing: IconButton(
                        onPressed: () {
                          deleteTak(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[800],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
