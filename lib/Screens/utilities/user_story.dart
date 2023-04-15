import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
class UserStory extends StatefulWidget {
  final String name;

  final String pic;

  const UserStory({Key? key, required this.name, required this.pic})
      : super(key: key);

  @override
  State<UserStory> createState() => _UserStoryState();
}

class _UserStoryState extends State<UserStory> {
  Widget fullScreenImage() => FullScreenWidget(
    disposeLevel: DisposeLevel.High,
    child:  CircleAvatar(
      radius: 32,
      backgroundColor: Colors.grey[400],
      backgroundImage: AssetImage(widget.pic.toString()),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
          child: Material(
            shape: CircleBorder(
                side: BorderSide(
                    color: Colors.red.shade400, width: 3, strokeAlign: 2)),
            child: fullScreenImage()
            ),

        ),
        SizedBox(
          height: 10,
        ),
        Text(widget.name.toString())
      ],
    );
  }
}
