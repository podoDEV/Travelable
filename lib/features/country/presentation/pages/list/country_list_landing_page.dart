import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/country_bloc.dart';

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
