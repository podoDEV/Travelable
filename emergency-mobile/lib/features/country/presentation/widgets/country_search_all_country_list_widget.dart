import 'package:flutter/material.dart';

import '../../domain/entities/country.dart';

class CountrySearchAllCountryListWidget extends StatelessWidget {
  final List<Country> countries;

  CountrySearchAllCountryListWidget({
    @required this.countries
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 0),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 57.5,
            padding: EdgeInsets.all(14),
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Row(children: <Widget>[
              Text(
                '${countries[index].name}'
              ),
            ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1, 
            color: Color.fromRGBO(151, 151, 151, 0.1)
          );
        },
        itemCount: countries.length,
      )
    );
  }
}