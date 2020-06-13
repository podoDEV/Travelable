import 'package:flutter/material.dart';

import '../../domain/entities/country.dart';
import 'country_card_widget.dart';

class CountryPinnedListWidget extends StatelessWidget {
  List<Country> countries = [];
  CountryPinnedListWidget({this.countries});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0, bottom: 60),
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return CountryCardWidget(country: countries[index]);
            },
          ),
        ));
  }
}
