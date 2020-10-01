import 'package:flutter/material.dart';

import '../../../domain/entities/covid.dart';

class CountryCovidWidget extends StatelessWidget {
  final Covid covid;
  const CountryCovidWidget({this.covid});

  @override
  Widget build(BuildContext context) {
    if (covid == null) {
      return Container();
    }
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '코로나 현황',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(48, 48, 48, 1)),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            SizedBox(
              width: 87,
              child: Text(
                '전일 대비 증감',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(106, 106, 106, 1)),
              ),
            ),
            Text(
              '${covid.deltaConfirmCases}명',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 58, 49, 1)),
            ),
          ],
        ),
        SizedBox(height: 2),
        Row(
          children: <Widget>[
            SizedBox(
                width: 87,
                child: Text(
                  '총 확진환자',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(106, 106, 106, 1)),
                )),
            Text(
              '${covid.totalConfirmCases}명',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(48, 48, 48, 1)),
            )
          ],
        ),
        SizedBox(height: 2),
        Row(
          children: <Widget>[
            SizedBox(
                width: 87,
                child: Text(
                  '총 사망자',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(106, 106, 106, 1)),
                )),
            Text(
              '${covid.totalDeathToll}명',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(48, 48, 48, 1)),
            )
          ],
        ),
      ],
    ));
  }
}
