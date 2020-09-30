import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/setting_page.dart';
import '../../../bloc/country_bloc.dart';
import '../../search/country_search_page.dart';

class CountryListNavigationBar extends StatelessWidget {
  const CountryListNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Container(
            width: 56,
            height: 56,
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () =>
                  Navigator.pushNamed(context, SettingPage.routeName),
              child: Image.asset('images/btn_setting.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Container(
            width: 56,
            height: 56,
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () =>
                  Navigator.pushNamed(context, CountrySearchPage.routeName)
                      .then((value) => BlocProvider.of<CountryBloc>(context)
                          .add(GetPinnedCountries())),
              child: Image.asset('images/btn_plus.png'),
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}
