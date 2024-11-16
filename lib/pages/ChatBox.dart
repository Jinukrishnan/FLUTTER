// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class ChatBox extends StatefulWidget {
//   const ChatBox({super.key});

//   @override
//   State<ChatBox> createState() => _ChatBoxState();
// }

// class _ChatBoxState extends State<ChatBox> {
//   Stream getMessages(String sender, String resiver) {
//     return FirebaseFirestore.instance.doc("Messageses").snapshots().where((event) => event.data()?["sender"] == sender && event.data()?["resiver"] == resiver);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//            Row(
//             children: [
//                Expanded(child: TextField()),
//             MaterialButton(onPressed: (){},child: Icon(Icons.send),)
//             ],
//            )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:chatbook/UserProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _messageController = TextEditingController();

  // Function to send messages to Firestore
  Future<void> sendMessage(String sender, String receiver, String message) async {
    if (message.trim().isNotEmpty) {
      await FirebaseFirestore.instance.collection("Messages").add({
        "sender": sender,
        "receiver": receiver,
        "message": message.trim(),
        "timestamp": FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    }
  }

  // Stream to get chat messages between two users
  Stream<QuerySnapshot> getMessages(String sender, String receiver) {
    print("================================================================");
    print(sender);
    print(receiver);
    print("================================================================");
    return FirebaseFirestore.instance
        .collection("Messages")
        .where("sender", isEqualTo: sender)
        .where("receiver", isEqualTo: receiver)
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final String sender = Provider.of<UserProvider>(context).uid.toString(); // Replace with the actual sender ID
    final String receiver = Provider.of<UserProvider>(context).sid.toString(); // Replace with the actual receiver ID

    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getMessages(sender, receiver),
              builder: (context, snapshot) {
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                print(snapshot.data);
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No messages yet"));
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final messageData = messages[index].data() as Map<String, dynamic>;
                    final isMe = messageData["sender"] == sender;

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          messageData["message"],
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  onPressed: () {
                    sendMessage(sender, receiver, _messageController.text);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: CircleBorder(),
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
