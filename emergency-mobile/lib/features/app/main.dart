import 'package:flutter/material.dart';

import '../country/presentation/pages/country_list_page.dart';
import '../country/presentation/pages/country_search_page.dart';
import 'launch_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: { 
        '/': (BuildContext context) => LaunchPage(), 
        '/country/list': (BuildContext context) => CountryListPage(),
        '/country/search': (BuildContext context) => CountrySearchPage(),
      },
    );
  }
}
