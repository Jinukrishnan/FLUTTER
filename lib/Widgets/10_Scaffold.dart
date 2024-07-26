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
              // 6-header section
              DrawerHeader(
                child: Text("Menu"),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
              ),

              // 7-List Tile
              ListTile(
                title: Text("Account"),
                subtitle: Text("click hrer to go to Account page"),
                leading: Icon(Icons.contact_emergency),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("go to favorite pages");
                },
                onLongPress: () {
                  print("try to delete");
                },
              ),
              ListTile(
                title: Text("Favorites"),
                subtitle: Text("click hrer to go to favorite page"),
                leading: Icon(Icons.favorite),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("go to favorite pages");
                },
                onLongPress: () {
                  print("try to delete");
                },
              ),
              ListTile(
                title: Text("Settings"),
                subtitle: Text("click hrer to go to Settings page"),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("go to favorite pages");
                },
                onLongPress: () {
                  print("try to delete");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
