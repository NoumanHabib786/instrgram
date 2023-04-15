import 'package:flutter/material.dart';
import 'package:instagram/Screens/pages/account.dart';
import 'package:instagram/Screens/pages/home.dart';
import 'package:instagram/Screens/pages/reels.dart';
import 'package:instagram/Screens/pages/search.dart';
import 'package:instagram/Screens/pages/shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigationBottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _children = [
    UserHome(),
    UserSearch(),
    UserReels(),
    UserShop(),
    UserAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigationBottombar,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'notify'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
            BottomNavigationBarItem(icon:  CircleAvatar(
              backgroundImage: AssetImage("assets/me.jpg"),
              radius: 15,
              backgroundColor: Colors.grey[300],
            ), label: 'account'),
          ]),
    );
  }
}
