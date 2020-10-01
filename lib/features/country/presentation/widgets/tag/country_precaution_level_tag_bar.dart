import 'package:flutter/material.dart';

import '../../../domain/entities/country.dart';
import 'country_precaution_level_tag.dart';

class CountryPrecautionLevelTagBar extends StatelessWidget {
  final Country country;

  CountryPrecautionLevelTagBar({this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 28,
        child: Row(
          children: <Widget>[
            CountryPrecautionLevelTag(level: country.precautionLevel)
          ],
        ));
  }
}
