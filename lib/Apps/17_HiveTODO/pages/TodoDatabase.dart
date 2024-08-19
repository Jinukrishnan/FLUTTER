import 'package:hive/hive.dart';

class TodoDatabase {
  List<dynamic> todos = [];
  // refference our box
  final _myBox = Hive.box("myBox");

  // run this method at first time whe opethe app
  void createInitialData() {
    todos = [
      ["Drink", true],
      ["Sleep", false],
      ["Walk", true],
      ["Work", false],
    ];
  }

  // load the data from data base
  void loadData() {
    todos = _myBox.get("Todos");
  }

  // update th dabase
  void updateDatabase() {
    _myBox.put("Todos", todos);
  }
}
