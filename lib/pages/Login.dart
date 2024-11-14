import 'package:chatbook/UserProvider.dart';
import 'package:chatbook/pages/ForgetPassword.dart';
import 'package:chatbook/pages/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
final CollectionReference users=FirebaseFirestore.instance.collection("users");
Future adduser(userid,username)async {
 QuerySnapshot querySnapshot = await users.where('userid', isEqualTo: userid).get();
if(querySnapshot.docs.isEmpty){
users.add({"userid":userid,"username":username});
  
}
}

 Future<dynamic> signIn() async {
    try {
      UserCredential uc = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );

      // Update the provider with the user ID
      adduser(uc.user!.uid,uc.user!.displayName);
      Provider.of<UserProvider>(context, listen: false).setUid(uc.user?.uid ?? '');
      
      print("====================================================================");
      print(uc.user!.displayName);
      print(Provider.of<UserProvider>(context,listen: false).uid);
    } catch (e) {
      print("Sign-in error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }

  Future signInWithGoogle()async {
    try {
        final firebaseAuth=await FirebaseAuth.instance;
        final  googleServices=await GoogleSignIn();
        final googleUser=await googleServices.signIn();
        final GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
        final cred=GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken  
        );
        final user=await firebaseAuth.signInWithCredential(cred);
        print("=========================================================================");
        print(user.user!.displayName);
      adduser(user.user!.uid,user.user!.displayName);
         Provider.of<UserProvider>(context, listen: false).setUid(user.user?.uid ?? '');
        print("=========================================================================");
    } catch (e) {
      
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
              GestureDetector(
                  onTap: signInWithGoogle,
                  child:  Center(child: Text("Sign In With Google")))
          ],
        ),
      ),
    );
  }
}