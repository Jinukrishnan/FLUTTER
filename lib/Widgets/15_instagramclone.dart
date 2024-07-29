import 'package:flutter/material.dart';

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text("Instagram"),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Icon(Icons.favorite),
                          Icon(Icons.message_outlined)
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  // color: Colors.green,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(5),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[300],
                            ),
                            Text("name")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
