import 'package:flutter/material.dart';

import 'features/app/launch_page.dart';
import 'features/country/presentation/pages/country_detail_page.dart';
import 'features/country/presentation/pages/country_list_page.dart';
import 'features/country/presentation/pages/country_search_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = {
      '/': (context) => LaunchPage(),
      '/country/list': (context) => CountryListPage(),
      '/country/search': (context) => CountrySearchPage(),
      CountryDetailPage.routeName: (context) => CountryDetailPage()
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
