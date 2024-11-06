import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userauthentication/ForgetPassword.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(),
      password: pwd.text.trim(),
    );
  }

  Future signInWithGoogle() async {
    try {
      final firebaseAuth = await FirebaseAuth.instance;
      final googleSevices = await GoogleSignIn();
      final googleUser = await googleSevices.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );
      final user = await firebaseAuth.signInWithCredential(cred);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    pwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.android,
                size: 100,
              ),
              // "Hello Again"
              SizedBox(height: 35),
              Text(
                "Hello Again !",
                style: GoogleFonts.bebasNeue(fontSize: 35),
              ),
              SizedBox(height: 30),
              Text(
                "Welcome back , You\'ve been missed !",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              // email textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // password textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      obscureText: true,
                      controller: pwd,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ForgetPassword();
                        }));
                      },
                      child: Text(
                        " Forget Password",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // sign in button-google
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signInWithGoogle,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Google Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              // not a member ? register now
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a Member? "),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      " Register Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
