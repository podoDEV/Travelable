import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/country_bloc.dart';

class CountrySearchControls extends StatefulWidget {
  const CountrySearchControls({
    Key key,
  }) : super(key: key);

  @override
  _CountrySearchControlsState createState() => _CountrySearchControlsState();
}

class _CountrySearchControlsState extends State<CountrySearchControls> {
  String inputStr = '';

  @override
  Widget build(BuildContext context) {
    dispatchSearch();
    return Container(
        height: 56,
        child: Row(
          children: <Widget>[
            SizedBox(width: 2),
            Container(
                width: 56,
                height: 56,
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => Navigator.pop(context),
                  child: Image.asset('images/btn_back_gray.png'),
                )),
            SizedBox(width: 2),
            Expanded(
              flex: 1,
              child: TextField(
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(48, 48, 48, 1)),
                  decoration: InputDecoration.collapsed(
                      hintText: '나라 이름을 검색해 주세요 🤩',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(182, 181, 181, 1))),
                  onChanged: (value) {
                    inputStr = value;
                    dispatchSearch();
                  }),
            ),
            SizedBox(width: 15),
            Container(
                width: 56,
                height: 56,
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: dispatchSearch,
                  child: Image.asset('images/btn_search_big.png'),
                )),
            SizedBox(width: 15)
          ],
        ));
  }

  void dispatchSearch() {
    BlocProvider.of<CountryBloc>(context).add(GetCountrySearchResult(inputStr));
  }
}
