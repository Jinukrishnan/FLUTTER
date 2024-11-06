import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("signrd in as : " + user.email!),
            MaterialButton(
              onPressed: () async {
                final googleUser = await GoogleSignIn();
                FirebaseAuth.instance.signOut();
                if (await googleUser.isSignedIn()) {
                  await googleUser.signOut();
                  await googleUser.disconnect();
                }
              },
              child: Text("Sign Out"),
            )
          ],
        ),
      ),
    );
  }
}
