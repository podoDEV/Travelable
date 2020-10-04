import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/country.dart';
import '../../../bloc/country_bloc.dart';
import 'country_search_bottom_sheet.dart';

class CountrySearchMatchingCountryListWidget extends StatelessWidget {
  final List<Country> countries;

  CountrySearchMatchingCountryListWidget({@required this.countries});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              // ignore: close_sinks
              final bloc = BlocProvider.of<CountryBloc>(context);
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return CountrySearchBottomSheet(
                        bloc: bloc, country: countries[index]);
                  });
            },
            child: Container(
              height: 57.5,
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Row(children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 62,
                      child: Image.asset('images/ic_search_small.png'),
                    ),
                    Text(countries[index].displayName,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(48, 48, 48, 1))),
                  ],
                ),
              ]),
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(height: 1, color: Color.fromRGBO(151, 151, 151, 0.1));
      },
      itemCount: countries.length,
    ));
  }
}
