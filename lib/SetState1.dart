import 'package:flutter/material.dart';
import 'package:providers/SetState2.dart';

class SetState1 extends StatefulWidget {
  const SetState1({super.key});

  @override
  State<SetState1> createState() => _SetState1State();
}

class _SetState1State extends State<SetState1> {
  List<int> numbers = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text("SetState"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SetState2(
                          numbers: numbers,
                        )));
              },
              icon: Icon(Icons.forward))
        ],
      ),
      body: Column(
        children: [
          Text("TOtoal Count is ${numbers.length}"),
          Expanded(
            child: ListView.builder(
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(numbers[index].toString()),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numbers.add(numbers.last + 1);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
