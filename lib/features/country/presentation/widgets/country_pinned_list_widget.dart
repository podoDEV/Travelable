import 'package:flutter/material.dart';

class CountryPinnedListWidget extends StatelessWidget {
  const CountryPinnedListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return _getPinnedCountryCardWidget();
            },
          ),
        ));
  }

  Widget _getPinnedCountryCardWidget() {
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
                height: 100,
                child: Text(
                  '',
                ))));
  }
}
