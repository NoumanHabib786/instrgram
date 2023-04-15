import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
class Grid_Container extends StatefulWidget {
  final String grid_image;
  const Grid_Container({Key? key, required this.grid_image}) : super(key: key);

  @override
  State<Grid_Container> createState() => _Grid_ContainerState();
}

class _Grid_ContainerState extends State<Grid_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(widget.grid_image.toString(), fit: BoxFit.cover),
      height: 10,
    );
  }
}
