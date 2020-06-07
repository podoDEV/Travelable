import 'package:flutter/material.dart';

import '../pages/country_detail_page.dart';

class CountryDetailBottomSheet extends StatelessWidget {
  const CountryDetailBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: EdgeInsets.only(top: 13, left: 17, right: 17, bottom: 39),
      child: Column(children: <Widget>[
        _getCountryDetailBottomSheetHandlerWidget(),
        SizedBox(height: 23),
        _getCountryDetailBottomSheetTitleWidget(),
        SizedBox(height: 16),
        _getCountryDetailBottomSheetSeparator(),
        SizedBox(height: 19),
        _getCountryDetailBottomSheetInfoWidget(),
        SizedBox(height: 17),
        _getCountryDetailBottomSheetSeparator(),
        SizedBox(height: 19),
        _getCountryDetailBottomSheetRegistWidget()
      ]),
    );
  }

  Widget _getCountryDetailBottomSheetRegistWidget() {
    return Container(
        padding: EdgeInsets.only(left: 44, right: 44),
        width: double.infinity,
        height: 56,
        child: RaisedButton(
          textColor: Color.fromRGBO(228, 230, 233, 1),
          color: Color.fromRGBO(11, 133, 255, 1),
          child: Text('등록',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        ));
  }

  Widget _getCountryDetailBottomSheetHandlerWidget() {
    return SizedBox(
      width: 34,
      height: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          color: Color.fromRGBO(216, 216, 216, 1),
        ),
      ),
    );
  }

  Column _getCountryDetailBottomSheetTitleWidget() {
    return Column(
      children: <Widget>[
        Text(
          '나의 국가 등록',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(48, 48, 48, 1)),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          '계속 알림을 받고 싶으시다면 등록해주세요',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(116, 116, 116, 1)),
        ),
      ],
    );
  }

  Widget _getCountryDetailBottomSheetSeparator() {
    return Container(
      height: 1,
      color: Color.fromRGBO(236, 236, 236, 1),
    );
  }

  Widget _getCountryDetailBottomSheetInfoWidget() {
    return Container(
      padding: EdgeInsets.only(left: 44, right: 44),
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            child: Row(
              children: <Widget>[
                Text(
                  '라오스',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(11, 133, 255, 1)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                '코로나 현황',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(48, 48, 48, 1)),
              )
            ],
          )
        ],
      ),
    );
  }
}
