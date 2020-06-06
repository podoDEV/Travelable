import 'package:flutter/material.dart';

class CountrySearchControlSeparator extends StatelessWidget {
  final double height;

  CountrySearchControlSeparator({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(height: height, color: Color.fromRGBO(228, 230, 233, 1));
  }
}
