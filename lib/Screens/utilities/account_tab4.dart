import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
import 'grids_container.dart';
class AccountTab4 extends StatefulWidget {
  const AccountTab4({Key? key}) : super(key: key);

  @override
  State<AccountTab4> createState() => _AccountTab4State();
}

class _AccountTab4State extends State<AccountTab4> {
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
