import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  final double height;
  final Color color;

  SeparatorWidget({@required this.height, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: color,
    );
  }
}
