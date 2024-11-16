import 'package:chatbook/pages/Users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> signOutGoogleUser() async {
    final googleSignIn=GoogleSignIn();

      try {
if(await googleSignIn.isSignedIn()){
  await  googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();

  if(await googleSignIn.isSignedIn()){
    await googleSignIn.disconnect();
  }
}
else{
  print("usernot signed in");
}
        
      } catch (e) {
        print(e);
      }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: signOutGoogleUser,
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("data"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Users()));
      },child: Icon(Icons.message),),
    );
  }
}
