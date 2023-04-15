import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';

class ExploreGrid extends StatefulWidget {
  const ExploreGrid({Key? key}) : super(key: key);

  @override
  State<ExploreGrid> createState() => _ExploreGridState();
}

class _ExploreGridState extends State<ExploreGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<user_provider>(
      builder: (context, value, child) {
        return GridView.builder(
          itemCount: value.stories.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 10,
                child: Image.asset(value.stories[index][1], fit: BoxFit.cover),
              ),
            );
          },
        );
      },
    );
  }
}
