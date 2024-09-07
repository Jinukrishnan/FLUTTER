import 'package:flutter/material.dart';

class SetState2 extends StatefulWidget {
  final List<int>? numbers;
  const SetState2({super.key, required this.numbers});

  @override
  State<SetState2> createState() => _SetState2State();
}

class _SetState2State extends State<SetState2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text("SetState"),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.forward))],
      ),
      body: Column(
        children: [
          Text("TOtoal Count is ${widget.numbers!.length}"),
          Expanded(
            child: ListView.builder(
                itemCount: widget.numbers!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.numbers![index].toString()),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.numbers!.add(widget.numbers!.last + 1);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
