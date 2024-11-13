import 'package:chatbook/pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
     TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController cpass=TextEditingController();
  Future signUp()async{
    try {
      if(pass.text.trim()==cpass.text.trim()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim());
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully registered')),
        
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    }
    } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // confirm password
              TextField( 
                controller: cpass,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Confirm Password",
              ),
            ),
            SizedBox(height: 20,),
          

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: signUp, child:Text("Sign Up")),
              ],
              
            ),
            GestureDetector(
                onTap: (){},
                child: Row(
                  children: [
                    Text("Already Member ?"),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: Text("Login",style: TextStyle(color: Colors.blue),)),
                  ],
                )),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}