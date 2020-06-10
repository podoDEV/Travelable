import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/country_bloc.dart';
import '../widgets/country_list_navigation_bar.dart';
import '../widgets/country_pinned_list_widget.dart';

class CountryListPage extends StatelessWidget {
  static const routeName = '/country/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  BlocProvider<CountryBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<CountryBloc>(),
        child: Container(
            color: Color.fromRGBO(228, 230, 233, 1),
            child: Column(
              children: <Widget>[
                SizedBox(height: 44),
                CountryListNavigationBar(),
                CountryPinnedListWidget()
              ],
            )));
  }
}
