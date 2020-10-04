import 'package:flutter/material.dart';

import '../../../../domain/entities/country.dart';
import '../../../bloc/country_bloc.dart';
import '../../../widgets/bottom_sheet_handler_widget.dart';

class CountryEditBottomSheet extends StatefulWidget {
  final CountryBloc bloc;
  final Country country;

  const CountryEditBottomSheet({Key key, this.bloc, this.country})
      : super(key: key);

  @override
  _CountryEditBottomSheetState createState() =>
      _CountryEditBottomSheetState(bloc: bloc, country: country);
}

class _CountryEditBottomSheetState extends State<CountryEditBottomSheet> {
  final CountryBloc bloc;
  final Country country;

  _CountryEditBottomSheetState({this.bloc, this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: EdgeInsets.only(top: 16, left: 43, right: 30, bottom: 48),
      child: Column(children: <Widget>[
        BottomSheetHandlerWidget(),
        SizedBox(height: 30),
        Container(
          height: 46,
          child: Row(children: [
            Expanded(
                child: Text('알림 설정',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(48, 48, 48, 1)))),
            Text(
              '일정을 먼저 등록해주세요.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(116, 116, 116, 1)),
            ),
            Switch(
              value: false,
              onChanged: (value) {
                setState(() {
                  // isSwitched=value;
                  // print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            )
          ]),
        ),
        Container(
            padding: EdgeInsets.only(right: 10),
            height: 46,
            child: Row(
              children: [
                Expanded(
                    child: Text('일정 수정',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(48, 48, 48, 1)))),
                Image.asset('images/btn_right.png')
              ],
            )),
        Container(
          padding: EdgeInsets.only(right: 10),
          height: 46,
          child: Row(
            children: [
              Expanded(
                child: Text('자세히 보기',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(48, 48, 48, 1))),
              ),
              Image.asset('images/btn_right.png')
            ],
          ),
        )
      ]),
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
}
