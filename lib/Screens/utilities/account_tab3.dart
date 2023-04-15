import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
import 'grids_container.dart';
class AccountTab3 extends StatefulWidget {
  const AccountTab3({Key? key}) : super(key: key);

  @override
  State<AccountTab3> createState() => _AccountTab3State();
}

class _AccountTab3State extends State<AccountTab3> {
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
                child: Grid_Container(grid_image: value.stories[index][3],)
            );
          },
        );
      },
    );
  }
}
