import 'package:apps/Apps/10_SharedPrefferance/SharedPreffernceTODO.dart';
import 'package:apps/Apps/11_Hive/HiveLocalStorage.dart';
import 'package:apps/Apps/12_HiveTODO/HiveTodo.dart';
import 'package:apps/Apps/1_NEUMOPHISM.dart';
import 'package:apps/Apps/2_DARK_NEUMORPHISM.dart';
import 'package:apps/Apps/3_BUTTONSWITHNEUMORPHISM.dart';
import 'package:apps/Apps/4_INNERSHADOW.dart';
import 'package:apps/Apps/5_Calculator/5_Calculaor.dart';
import 'package:apps/Apps/6_multiplicationtable/MultplicatioTable.dart';
import 'package:apps/Apps/7_ArrayTodo/ArrayTodo.dart';
import 'package:apps/Apps/8_CustomUI/CustomUI.dart';
import 'package:apps/Apps/9_SendMSGmakeCALL/SendMSGmakeCALL.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  // runApp(Neumorphism());
  // runApp(Calculator());
  // runApp(MultiplicationTable());
  // runApp(ArrayTodo());
  // runApp(CustomUI());
  // runApp(SendMSGmakeCALL());
  // runApp(MaterialApp(home: SharedPreffernceTODO()));

// ====================================================================
  // // initial hive
  // await Hive.initFlutter();
  // // open the box
  // var box = await Hive.openBox('mybox');
  // runApp(MaterialApp(home: HiveLocalStorage()));
  // =====================================================
  // initial hive
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox('mybox');
  runApp(MaterialApp(
    home: HiveTodo(),
    theme: ThemeData(primarySwatch: Colors.yellow),
  ));
}
