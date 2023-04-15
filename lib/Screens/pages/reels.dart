import 'package:flutter/material.dart';

import '../utilities/notify.dart';

class UserReels extends StatefulWidget {
  const UserReels({Key? key}) : super(key: key);

  @override
  State<UserReels> createState() => _UserReelsState();
}

class _UserReelsState extends State<UserReels> {
  @override
  Widget build(BuildContext context) {
    return NotifyScreen();
  }
}
