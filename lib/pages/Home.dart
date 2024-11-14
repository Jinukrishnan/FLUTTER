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
  final googleSignIn = GoogleSignIn();

  try {
    // Check if Google user is signed in
    if (await googleSignIn.isSignedIn()) {
      // Sign out from Google and Firebase
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      // Only attempt disconnect if still signed in
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect();
      }
    } else {
      print('User is not signed in.');
    }
  } catch (e) {
    print("Error during Google Sign Out: $e");
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
