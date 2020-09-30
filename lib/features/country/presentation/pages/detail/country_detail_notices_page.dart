import 'package:flutter/material.dart';

import '../../../domain/entities/country.dart';

class CountryDetailNoticesPage extends StatelessWidget {
  final Country country;

  const CountryDetailNoticesPage({@required this.country});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 200),
      children: <Widget>[
        Center(
          child: Text(
            '서비스 준비중...',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(116, 116, 116, 1)),
          ),
        )
      ],
    );
  }
}
