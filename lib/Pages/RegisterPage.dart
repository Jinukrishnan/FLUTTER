import 'package:flutter/material.dart';
import 'package:foody/Components/MyButton.dart';

import '../Components/MyTextFiel.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
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
              "Let's create account for you",
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
            // confirm password text field
            MytextField(
                controller: cpass, hintText: "Confirm Password", obscureText: false),
            SizedBox(
              height: 25,
            ),

            // signup button
            MyButton(onTap: () {}, text: "Sign Up"),
            SizedBox(
              height: 25,
            ),

            // already have an account? log in here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account ? ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login  Now",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
