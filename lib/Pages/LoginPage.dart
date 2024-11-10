import 'package:flutter/material.dart';
import 'package:foody/Components/MyButton.dart';
import 'package:foody/Components/MyTextFiel.dart';
import 'package:foody/Pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();


  void LogIn(){
    // authentication section  


    //navigate to  Home Page
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 25,
            ),

            // message/app slogan
            Text(
              "Food Delivery App",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 25,
            ),
            // email text field
            MytextField(
                controller: email, hintText: "Email", obscureText: false),
            SizedBox(
              height: 25,
            ),

            // password text field
            MytextField(
                controller: pass, hintText: "Password", obscureText: false),
            SizedBox(
              height: 25,
            ),

            // signin button
            MyButton(
              onTap:  LogIn,
             text: "Sign In"),
            SizedBox(
              height: 25,
            ),

            // not a member ? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a Member ?",
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register Now",
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
