import 'package:chatbook/UserProvider.dart';
import 'package:chatbook/pages/ForgetPassword.dart';
import 'package:chatbook/pages/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();



 Future<dynamic> signIn() async {
    try {
      UserCredential uc = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );

      // Update the provider with the user ID
      Provider.of<UserProvider>(context, listen: false).setUid(uc.user?.uid ?? '');

      print("====================================================================");
      print(Provider.of<UserProvider>(context,listen: false).uid);
    } catch (e) {
      print("Sign-in error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email
            SizedBox(height: 300,),
            TextField( 
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
            ),
            SizedBox(height: 30,),
            // password
              TextField( 
                controller: pass,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
            ),
            SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                },
                child: Text("For get password")),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: signIn, child:Text("Sign In")),
              ],
              
            ),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                },
                child: Row(
                  children: [
                    Text("Not a Member ?"),
                    SizedBox(width: 10,),
                    Text("Register",style: TextStyle(color: Colors.blue),),
                  ],
                )),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}