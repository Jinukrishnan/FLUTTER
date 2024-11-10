import 'package:flutter/material.dart';
import 'package:foody/Pages/LoginPage.dart';
import 'package:foody/Pages/RegisterPage.dart';
import 'package:foody/auth/Login_or_Register.dart';
import 'package:foody/themes/ThemeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      child:MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(onTap: (){},),
      home: Login_or_Register(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

