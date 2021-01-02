import 'package:flutter/material.dart';

import 'core/usecases/usecase.dart';
import 'features/app/launch_page.dart';
import 'features/app/setting_page.dart';
import 'features/country/presentation/pages/detail/country_detail_page.dart';
import 'features/country/presentation/pages/list/country_list_page.dart';
import 'features/country/presentation/pages/search/country_search_page.dart';
import 'features/member/domain/usecases/login_usecase.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future _initFuture = Init.initialize();

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CountryListPage();
          } else {
            return LaunchPage(); //SplashScreen();
          }
        },
      ),
      // initialRoute: ,
      // initialRoute: LaunchPage.routeName,
      routes: routes,
    );
  }
}

class Init {
  static Future initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  static _registerServices() async {
    await Future.delayed(
        Duration(seconds: 1), () => sl<LoginUseCase>()(NoParams()));
    // await sl<LoginUseCase>()(NoParams());
  }

  static _loadSettings() async {}
}
