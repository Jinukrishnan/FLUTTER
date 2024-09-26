import 'package:cofeeshope/components/bottom_nav_bar.dart';
import 'package:cofeeshope/pages/CartPage.dart';
import 'package:cofeeshope/pages/ShopPage.dart';
import 'package:flutter/material.dart';
import 'package:cofeeshope/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // navigate bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    //shop page
    ShopPage(),
    CartPage()
    // cart page
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[_selectedIndex],
    );
  }
}
