import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/country_bloc.dart';
import '../widgets/country_search_controls.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_widget.dart';

class CountrySearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context)
    );
  }

  BlocProvider<CountryBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CountryBloc>(),
      child: Column(children: <Widget>[
        SizedBox(height: 44),
        CountrySearchControls(),
        Container(
          height: 44,
          child: Placeholder(),
        ),
        Container(
          height: 11, 
          color: Color.fromRGBO(241, 241, 241, 1)
        ),
        CountrySearchResults(),
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
            } else if (state is Loaded) {
              return MessageDisplay(message: state.countries.toString());
            }
            return Container();
          },
        )
      ]),
    );
  }
}