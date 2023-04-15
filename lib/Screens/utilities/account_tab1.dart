import 'package:flutter/material.dart';
import 'package:instagram/Screens/screen_provider.dart';
import 'package:provider/provider.dart';

import 'grids_container.dart';

class AccountTab1 extends StatefulWidget {
  const AccountTab1({Key? key}) : super(key: key);

  @override
  State<AccountTab1> createState() => _AccountTab1State();
}

class _AccountTab1State extends State<AccountTab1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<user_provider>(
      builder: (context, value, child) {
        return GridView.builder(
          itemCount: value.stories.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Grid_Container(grid_image: value.stories[index][1],)
            );
          },
        );
      },
    );
  }
}
