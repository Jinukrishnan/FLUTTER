import 'package:flutter/material.dart';

class MultiplicationTable extends StatefulWidget {
  const MultiplicationTable({super.key});

  @override
  State<MultiplicationTable> createState() => _MultiplicationTableState();
}

class _MultiplicationTableState extends State<MultiplicationTable> {
  TextEditingController _textEditControlller = TextEditingController();
  List<String> ls = [];

  void multiplicationTable() {
    try {
      var data = int.parse(_textEditControlller.text);
      print(data);
      setState(() {
        ls = [];
        for (var i = 1; i <= 10; i++) {
          ls.add("${i} X ${data} = ${i * data}");
        }
      });
      print(ls);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _textEditControlller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  multiplicationTable();
                },
                child: Text(
                  "Generate Table",
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                    itemCount: ls.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Center(child: Text(ls[index])),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
