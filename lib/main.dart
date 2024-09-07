import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/SetState1.dart';
import 'package:providers/provider/numberListProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NumberListProvider(),
    child: MaterialApp(
      home: SetState1(),
    ),
  ));
}
