import 'package:emergency/features/country/presentation/pages/country_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/country_bloc.dart';
import '../widgets/country_list_navigation_bar.dart';
import '../widgets/country_pinned_list_widget.dart';

class CountryListPage extends StatefulWidget {
  static const routeName = '/country/list';

  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  BlocProvider<CountryBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<CountryBloc>(),
        child:
            BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
          if (state is Empty) {
            return CountryListLandingPage();
          } else if (state is PinnedLoaded) {
            return Container(
                color: Color.fromRGBO(228, 230, 233, 1),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 44),
                    CountryListNavigationBar(),
                    CountryPinnedListWidget(
                      countries: state.countries,
                    )
                  ],
                ));
          } else if (state is NoPinned) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '나라를 등록해주세요',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(48, 48, 48, 1)),
                ),
                SizedBox(height: 24),
                Text(
                  '나라를 등록해서 코로나 19 현황과\n 위급 상황 시 필요한 연락처를 알아두세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(116, 116, 116, 1)),
                ),
                SizedBox(height: 24),
                _getCountryRegistWidget(context)
              ],
            );
          } else {
            return Container();
          }
        }));
  }

  Widget _getCountryRegistWidget(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 44, right: 44),
        width: double.infinity,
        height: 56,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Color.fromRGBO(11, 133, 255, 1)),
                borderRadius: BorderRadius.all(Radius.circular(27))),
            child: RaisedButton(
              textColor: Color.fromRGBO(11, 133, 255, 1),
              color: Colors.white,
              child: Text('나라 등록하러 가기',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
              onPressed: () =>
                  Navigator.pushNamed(context, CountrySearchPage.routeName),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27)),
            )));
  }
}

class CountryListLandingPage extends StatelessWidget {
  const CountryListLandingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CountryBloc>(context).add(GetPinnedCountries());
    return Container();
  }
}
