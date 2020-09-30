import 'package:flutter/material.dart';

import '../../../domain/entities/country.dart';
import 'country_card_tag_item_widget.dart';

class CountryCardTagBar extends StatelessWidget {
  final Country country;

  CountryCardTagBar({this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        CountryCardTagItemWidget(level: country.precautionLevel)
      ],
    ));
  }
}
