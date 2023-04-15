import 'package:flutter/material.dart';
import 'package:instagram/Screens/screen_provider.dart';
import 'package:provider/provider.dart';

import 'Screens/homepage.dart';
import 'Screens/pages/account.dart';
import 'Screens/pages/search.dart';
import 'Screens/pages/shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => user_provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.grey),
      ),
    );
  }
}
