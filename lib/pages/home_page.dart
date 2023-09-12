import 'package:coffee_app/components/bottom_nav_bar.dart';
import 'package:coffee_app/const.dart';
import 'package:coffee_app/pages/Login/Register/welcome_screen.dart';
import 'package:coffee_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//navigate bottom bar

  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// pages
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),

    const WelcomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
