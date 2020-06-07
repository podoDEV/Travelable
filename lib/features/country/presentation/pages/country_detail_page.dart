import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/country.dart';
import '../bloc/country_bloc.dart';
import 'country_detail_info_page.dart';
import 'country_detail_notices_page.dart';

class CountryDetailPageArguments {
  final Country country;

  CountryDetailPageArguments(this.country);
}

class CountryDetailPage extends StatefulWidget {
  static const routeName = '/country/detail';

  const CountryDetailPage({
    Key key,
  }) : super(key: key);

  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  int selectedIndex;
  PageController controller;

  @override
  void initState() {
    selectedIndex = 0;
    controller = PageController(initialPage: selectedIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  BlocProvider<CountryBloc> buildBody(BuildContext context) {
    final CountryDetailPageArguments args =
        ModalRoute.of(context).settings.arguments;
    final country = args.country;

    return BlocProvider(
        create: (_) => sl<CountryBloc>(),
        child: Column(
          children: <Widget>[
            _getCountryDetailNavigationBarWidget(context, country),
            _getCountryDetailPageBarWidget(),
            _getCountryDetailPageBody(country)
          ],
        ));
  }

  Widget _getCountryDetailNavigationBarWidget(
      BuildContext context, Country country) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 48,
          child: Container(color: Color.fromRGBO(11, 133, 255, 1)),
        ),
        Container(
          height: 59,
          color: Color.fromRGBO(11, 133, 255, 1),
          child: Row(
            children: <Widget>[
              Container(
                  width: 56,
                  height: 56,
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => Navigator.pop(context),
                    child: Image.asset('images/btn_back_white.png'),
                  )),
              Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    country.displayName,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(228, 230, 233, 1)),
                  ))),
              SizedBox(
                width: 56,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _getCountryDetailPageBarWidget() {
    return Container(
        height: 57,
        padding: EdgeInsets.only(top: 14, left: 17, right: 17),
        child: Row(
          children: <Widget>[
            _getCountryDetailPageBarItemWidget(title: '주요 정보', index: 0),
            _getCountryDetailPageBarItemWidget(title: '안전 공지', index: 1),
          ],
        ));
  }

  Widget _getCountryDetailPageBarItemWidget({String title, int index}) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                selectedIndex = index;
                controller.animateToPage(index,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              });
            },
            child: Column(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      child: Center(
                          child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: selectedIndex == index
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: selectedIndex == index
                            ? Color.fromRGBO(11, 133, 255, 1)
                            : Color.fromRGBO(136, 136, 136, 1)),
                  )))),
              Container(
                height: selectedIndex == index ? 2 : 1,
                color: selectedIndex == index
                    ? Color.fromRGBO(11, 133, 255, 1)
                    : Color.fromRGBO(236, 236, 236, 1),
              )
            ])));
  }

  Widget _getCountryDetailPageBody(Country country) {
    return Expanded(
      flex: 1,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: <Widget>[
          CountryDetailInfoPage(country: country),
          CountryDetailNoticesPage(country: country)
        ],
      ),
    );
  }
}
