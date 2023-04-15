import 'package:flutter/cupertino.dart';

class user_provider with ChangeNotifier {
  List stories = [
    ["Ahmar", 'assets/r6.jpg', 'assets/story.jpg', 'assets/s1.jpeg'],
    ["Fakhar Ali", 'assets/r7.jpg', 'assets/story2.jpg', 'assets/s2.jpg'],
    ["Ahsan", 'assets/r8.jpg', 'assets/ss.jpg', 'assets/s3.jpeg'],
    ["Furkan", 'assets/r9.jpg', 'assets/story3.jpg', 'assets/s4.jpg'],
    ["Obaid", 'assets/r10.jpg', 'assets/story4.jpg', 'assets/s1.jpeg'],
    ["Safeer", 'assets/inst_3.jpeg', 'assets/story5.jpg', 'assets/s5.jpg'],
    ["Nouman", 'assets/inst_2.jpg', 'assets/icon2.jpeg', 'assets/s3.jpeg'],
    ["Rao", 'assets/inst_1.png', 'assets/icon3.jpeg', 'assets/s2.jpg'],
    ["Husnain", 'assets/inst_3.jpeg', 'assets/icon1.jpeg', 'assets/s1.jpeg'],
    ["Dabeer", 'assets/inst_4.webp', 'assets/icon3.jpeg', 'assets/s6.jpg'],
    ["Shahrooz", 'assets/s1.jpeg', 'assets/icon2.jpeg', 'assets/s7.jpg'],
    ["Ali", 'assets/r4.jpg', 'assets/icon3.jpeg', 'assets/s8.jpg'],
    ["Ahmad", 'assets/r3.jpg', 'assets/icon1.jpeg', 'assets/s1.jpeg'],
    ["Dua", 'assets/r2.webp', 'assets/icon3.jpeg', 'assets/s9.jpg'],
    ["Ramzan", 'assets/r1.jpg', 'assets/icon1.jpeg', 'assets/s10.jpg'],
    ["Usama", 'assets/r5.jpg', 'assets/icon2.jpeg', 'assets/s3.jpeg'],
  ];

  final List selecteditems = [];

  get SelectedItems => selecteditems;

  get Stories => stories;

  void additems(int index) {
    selecteditems.add(index);
    notifyListeners();
  }

  void removeItems(int index) {
    selecteditems.remove(index);
    notifyListeners();
  }
}
