import 'package:flutter/material.dart';

import '../../../domain/entities/country.dart';
import '../../pages/detail/country_detail_page.dart';
import '../separator_widget.dart';
import '../tag/country_precaution_level_tag_bar.dart';
import 'country_covid_widget.dart';

class CountryCardWidget extends StatelessWidget {
  final Country country;
  const CountryCardWidget({this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 230, 233, 1),
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
              onPressed: () => Navigator.pushNamed(
                  context, CountryDetailPage.routeName,
                  arguments: CountryDetailPageArguments(country)),
              child: Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 16, right: 20, bottom: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CountryPrecautionLevelTagBar(country: country),
                        SizedBox(height: 14),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              country.displayName,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(48, 48, 48, 1)),
                            ),
                            Text(
                              '일정을 등록해주세요.',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(116, 116, 116, 1)),
                            )
                          ],
                        )),
                        SizedBox(height: 12),
                        SeparatorWidget(
                            height: 2, color: Color.fromRGBO(236, 236, 236, 1)),
                        SizedBox(height: 16),
                        CountryCovidWidget(covid: country.covid)
                        // CountryCardWidget()
                      ])))),
    );
  }
}
