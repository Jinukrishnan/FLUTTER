import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/ProviderState2.dart';
import 'package:providers/SetState2.dart';
import 'package:providers/provider/numberListProvider.dart';

class ProviderState1 extends StatefulWidget {
  const ProviderState1({super.key});

  @override
  State<ProviderState1> createState() => _ProviderState1State();
}

class _ProviderState1State extends State<ProviderState1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (context, NumberListModal, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Center(
                  child: Text("SetState"),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProviderState2()));
                      },
                      icon: Icon(Icons.forward))
                ],
              ),
              body: Column(
                children: [
                  Text("TOtoal Count is ${NumberListModal.numbers.length}"),
                  Expanded(
                    child: ListView.builder(
                        itemCount: NumberListModal.numbers.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(NumberListModal.numbers[index].toString()),
                          );
                        }),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  NumberListModal.addNumbers();
                },
                child: Icon(Icons.add),
              ),
            ));
  }
}
