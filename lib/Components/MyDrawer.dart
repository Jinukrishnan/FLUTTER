import 'package:flutter/material.dart';
import 'package:foody/Components/MyDrawerTile.dart';
import 'package:foody/Pages/SettingsPage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // home list tile
          MyDrawerTile(icon: Icons.home, onTap: ()=>Navigator.pop(context), text: "H O M E"),
          // settingts list tile
          MyDrawerTile(
              icon: Icons.settings, onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage() ));
              }, text: "S E T T I N G S"),

          const Spacer(),
        
          // logout list tile
          MyDrawerTile(icon: Icons.lock, onTap: () {}, text: "L O G O U T"),
            SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
