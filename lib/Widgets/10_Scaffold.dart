import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
        // 6-Bottum NavigationBar
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: "home",
        //       tooltip: "click here",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add),
        //       label: "Post",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search),
        //       label: "search",
        //     ),

        //     // BottomNavigationBarItem(
        //     //   icon: Icon(Icons.video_call),
        //     //   label: "media",
        //     // ),
        //   ],
        // ),
        backgroundColor: Colors.deepPurple,

        // first install curved_navigation_bar: ^1.0.6
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepPurple,
          color: Colors.deepPurple.shade200,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            print(index);
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
