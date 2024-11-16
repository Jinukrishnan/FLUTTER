import 'package:chatbook/UserProvider.dart';
import 'package:chatbook/pages/ChatBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<Map<String, dynamic>> usersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  void getUsers() async {
    // Get the Firestore collection reference
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Fetch all documents from the collection
    QuerySnapshot querySnapshot = await users.get();

    // Update the state with the fetched data
    setState(() {
      usersList = querySnapshot.docs
          .map((doc) =>
              doc.data() as Map<String, dynamic>) // Convert document to map
          .toList();
    });
    print(usersList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Users"),
        ),
      ),
      body: usersList.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loading spinner if data is empty
          : ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (context, index) {
                // Get the data for each user
                var user = usersList[index];
                return ListTile(
                  title: Text(user['username'] ??
                      'No User Name'), // Display userId or fallback to a default text
           
                  onTap: () {
                    // Handle item tap (e.g., navigate to a details page)
                    print('Tapped on ${user['userid']}');
                    Provider.of<UserProvider>(context, listen: false).setSid(user['userid'] ?? '');
                    print(Provider.of<UserProvider>(context, listen: false).uid);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatBox()));
                  },
                );
              },
            ),
    );
  }
}
