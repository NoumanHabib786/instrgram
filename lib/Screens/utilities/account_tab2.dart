import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
import 'grids_container.dart';
class AccountTab2 extends StatefulWidget {
  const AccountTab2({Key? key}) : super(key: key);

  @override
  State<AccountTab2> createState() => _AccountTab2State();
}

class _AccountTab2State extends State<AccountTab2> {
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
                child: Grid_Container(grid_image: value.stories[index][2],)
            );
          },
        );
      },
    );
  }
}
