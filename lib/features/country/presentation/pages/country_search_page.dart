import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/country_bloc.dart';
import '../widgets/country_search_all_country_list_widget.dart';
import '../widgets/country_search_control_separator.dart';
import '../widgets/country_search_controls.dart';
import '../widgets/country_search_matching_country_list_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_widget.dart';

class CountrySearchPage extends StatefulWidget {
  const CountrySearchPage({
    Key key,
  }) : super(key: key);

  @override
  _CountrySearchPageState createState() => _CountrySearchPageState();
}

class _CountrySearchPageState extends State<CountrySearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  BlocProvider<CountryBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CountryBloc>(),
      child: Column(children: <Widget>[
        SizedBox(
          height: 44,
          child: Container(color: Colors.white),
        ),
        CountrySearchControls(),
        Expanded(flex: 1, child: CountrySearchResults())
      ]),
    );
  }
}

class CountrySearchResults extends StatefulWidget {
  const CountrySearchResults({
    Key key,
  }) : super(key: key);

  @override
  _CountrySearchResultsState createState() => _CountrySearchResultsState();
}

class _CountrySearchResultsState extends State<CountrySearchResults> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is Empty) {
              return MessageDisplay(message: 'Lets go');
            } else if (state is Loading) {
              return LoadingWidget();
            } else if (state is Error) {
              return MessageDisplay(message: state.message);
            } else if (state is AllLoaded) {
              return Expanded(
                  flex: 1,
                  child: Column(children: <Widget>[
                    CountrySearchControlSeparator(height: 11),
                    SizedBox(
                      height: 21,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    CountrySearchAllCountryListWidget(
                      countries: state.countries,
                      indexing: state.indexing,
                    )
                  ]));
            } else if (state is MatchingLoaded) {
              return Expanded(
                  flex: 1,
                  child: Column(children: <Widget>[
                    CountrySearchControlSeparator(height: 1),
                    CountrySearchMatchingCountryListWidget(
                        countries: state.countries)
                  ]));
            }
            return Container();
          },
        )
      ]),
    );
  }
}
