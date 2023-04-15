import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
class ShopGrid extends StatefulWidget {
  const ShopGrid({Key? key}) : super(key: key);

  @override
  State<ShopGrid> createState() => _ShopGridState();
}

class _ShopGridState extends State<ShopGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<user_provider>(
      builder: (context, value, child) {
        return GridView.builder(
          itemCount: value.stories.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 10,
                child: Image.asset(value.stories[index][3], fit: BoxFit.cover),
              ),
            );
          },
        );
      },
    );
  }
}
