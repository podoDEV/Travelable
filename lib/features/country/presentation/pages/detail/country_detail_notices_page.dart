import 'package:flutter/material.dart';

import '../../../domain/entities/country.dart';

class CountryDetailNoticesPage extends StatelessWidget {
  final Country country;

  const CountryDetailNoticesPage({@required this.country});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: <Widget>[],
    );
  }
}
