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
      height: 44,
      child: Row(
        children: <Widget>[
          Container(
            width: 44,
            child: Placeholder()
          ),
          Expanded(
            flex: 1,
            child: TextField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '나라 이름을 검색해 주세요.'
              ),
              onChanged: (value) {
                inputStr = value;
                dispatchSearch();
              }
            ),
          ),
          Container(
            width: 44,
            child: RaisedButton(
              child: Text('Search'),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: dispatchSearch,
            )
          )
        ],
      )
    );
  }

  void dispatchSearch() {
    BlocProvider.of<CountryBloc>(context)
        .add(GetCountrySearchResult(inputStr));
  }
}