import 'package:emergency/features/app/setting_page.dart';
import 'package:flutter/material.dart';

import 'features/app/launch_page.dart';
import 'features/country/presentation/pages/detail/country_detail_page.dart';
import 'features/country/presentation/pages/list/country_list_page.dart';
import 'features/country/presentation/pages/search/country_search_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = {
      LaunchPage.routeName: (context) => LaunchPage(),
      CountryListPage.routeName: (context) => CountryListPage(),
      CountrySearchPage.routeName: (context) => CountrySearchPage(),
      CountryDetailPage.routeName: (context) => CountryDetailPage(),
      SettingPage.routeName: (context) => SettingPage()
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LaunchPage.routeName,
      routes: routes,
    );
  }
}
