import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/provider/numberListProvider.dart';

class ProviderState2 extends StatefulWidget {
  const ProviderState2({super.key});

  @override
  State<ProviderState2> createState() => _ProviderState2State();
}

class _ProviderState2State extends State<ProviderState2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (contect, NumberListModal, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.yellow,
                title: Center(
                  child: Text("SetState"),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.forward))
                ],
              ),
              body: Column(
                children: [
                  Text("TOtoal Count is ${NumberListModal.numbers!.length}"),
                  Expanded(
                    child: ListView.builder(
                        itemCount: NumberListModal.numbers!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                NumberListModal.numbers![index].toString()),
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
