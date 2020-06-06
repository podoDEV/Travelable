import 'package:flutter/material.dart';

import 'injection_container.dart' as di;
import 'features/app/launch_page.dart';
import 'features/country/presentation/pages/country_list_page.dart';
import 'features/country/presentation/pages/country_search_page.dart';

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes2 = {
      '/': (BuildContext context) => LaunchPage(),
      '/country/list': (BuildContext context) => CountryListPage(),
      '/country/search': (BuildContext context) => CountrySearchPage(),
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes2,
    );
  }
}
