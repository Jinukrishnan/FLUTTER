import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("Scaffold"),
        // backgroundColor: Colors.red,
// =========================================================
        // 1-st topic
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 10,
          shadowColor: Colors.grey,
          title: Text(
            "Phone",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
// =========================================================

          // 2- add widget in left side
          // leading: Icon(
          //   Icons.phone,
          //   color: Colors.white,
          // ),
          // disable this leading when we create drawer///////////////////
// =========================================================

          // 3-add widget right side
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
// =========================================================

        // 4-floatin action button
        floatingActionButton: TextButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            // color: Colors.red,
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey[900],
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
        ),
        // =========================================================

        // 5-drawer section
        drawer: Drawer(
            // backgroundColor: Colors.red,
            child: ListView(
              children: [
                
              ],
            ),
            ),
      ),
    );
  }
}
