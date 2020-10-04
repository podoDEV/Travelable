import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/country.dart';
import '../../../bloc/country_bloc.dart';
import '../../../widgets/card/country_covid_widget.dart';
import '../../../widgets/tag/country_precaution_level_tag_bar.dart';

class CountrySearchBottomSheet extends StatefulWidget {
  final CountryBloc bloc;
  final Country country;

  const CountrySearchBottomSheet({Key key, this.bloc, this.country})
      : super(key: key);

  @override
  _CountrySearchBottomSheetState createState() =>
      _CountrySearchBottomSheetState(bloc: bloc, country: country);
}

class _CountrySearchBottomSheetState extends State<CountrySearchBottomSheet> {
  final CountryBloc bloc;
  final Country country;

  _CountrySearchBottomSheetState({this.bloc, this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
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
        _getCountryDetailBottomSheetRegistWidget(context)
      ]),
    );
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  country.displayName,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(11, 133, 255, 1)),
                ),
                SizedBox(
                  width: 11,
                ),
                CountryPrecautionLevelTagBar(country: country)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CountryCovidWidget(covid: country.covid)
        ],
      ),
    );
  }

  Widget _getCountryDetailBottomSheetRegistWidget(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 44, right: 44),
        width: double.infinity,
        height: 56,
        child: RaisedButton(
          textColor: Color.fromRGBO(228, 230, 233, 1),
          color: Color.fromRGBO(11, 133, 255, 1),
          child: Text('등록',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
          onPressed: () {
            bloc.add(PinCountry(country.id));

            // BlocProvider.of<CountryBloc>(context).add(PinCountry(country.id));
            // bloc.state.listen((state) {

            // });
            BlocListener<CountryBloc, CountryState>(listener: (context, state) {
              if (state is DetailSheetClosed) {
                Navigator.pop(context);
              }
            });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        ));
  }
}
