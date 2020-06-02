import 'package:flutter/material.dart';

class CountrySearchControlSeparator extends StatelessWidget {
  const CountrySearchControlSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11, 
      color: Color.fromRGBO(241, 241, 241, 1)
    );
  }
}
