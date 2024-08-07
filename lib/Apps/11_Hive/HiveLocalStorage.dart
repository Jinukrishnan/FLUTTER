import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveLocalStorage extends StatefulWidget {
  const HiveLocalStorage({super.key});

  @override
  State<HiveLocalStorage> createState() => _HiveLocalStorageState();
}

class _HiveLocalStorageState extends State<HiveLocalStorage> {
  // refference our box
  final _myBox = Hive.box('mybox');
  // write data method
  void writeData() {
    _myBox.put(1, "Synnefo");
    print(_myBox.get(1));
  }

  // read data method
  void readData() {
    print(_myBox.get(1));
  }

  // delete data mathod
  void deleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: writeData,
              child: Text("Write"),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: readData,
              child: Text("Read"),
              color: Colors.yellow,
            ),
            MaterialButton(
              onPressed: deleteData,
              child: Text("Delete"),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
