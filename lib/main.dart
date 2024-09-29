import 'package:flutter/material.dart';
import 'package:passwordhashing/ValidatePage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("Auth");
  runApp(Validatepage());
}
