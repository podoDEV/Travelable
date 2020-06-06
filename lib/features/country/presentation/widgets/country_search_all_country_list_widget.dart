import 'package:flutter/material.dart';

import '../../domain/entities/country.dart';
import 'country_search_matching_country_list_widget.dart';

class CountrySearchAllCountryListWidget extends StatefulWidget {
  final List<Country> countries;
  final List<String> indexing;

  const CountrySearchAllCountryListWidget(
      {Key key, this.countries, this.indexing})
      : super(key: key);

  @override
  _CountrySearchAllCountryListWidgetState createState() =>
      _CountrySearchAllCountryListWidgetState(
          countries: countries, indexing: indexing);
}

class _CountrySearchAllCountryListWidgetState
    extends State<CountrySearchAllCountryListWidget> {
  ScrollController _controller;
  double _offsetContainer;
  var _text;
  var _oldText;
  var _heightScroller;
  var _sizeHeightContainer;
  var posSelected = 0;
  var diff = 0.0;
  var height = 0.0;
  var textSliderPos = 0.0;
  var _rowHeight = 57.5;

  final List<Country> countries;
  final List<String> indexing;

  _CountrySearchAllCountryListWidgetState(
      {@required this.countries, @required this.indexing});

  @override
  void initState() {
    _offsetContainer = 0.0;
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Expanded(child: new LayoutBuilder(builder: (context, contrainsts) {
      diff = height - contrainsts.biggest.height;
      _heightScroller = (contrainsts.biggest.height) / indexing.length;
      _sizeHeightContainer = (contrainsts.biggest.height);
      return new Stack(children: [
        ListView.separated(
          padding: EdgeInsets.only(top: 0),
          scrollDirection: Axis.vertical,
          controller: _controller,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return CountryDetailBottomSheet();
                    });
              },
              child: Container(
                height: _rowHeight,
                padding: EdgeInsets.all(14),
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Row(children: <Widget>[
                  Text('${countries[index].name}'),
                ]),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
                height: 1, color: Color.fromRGBO(151, 151, 151, 0.1));
          },
          itemCount: countries.length,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onVerticalDragUpdate: _onVerticalDragUpdate,
            onVerticalDragStart: _onVerticalDragStart,
            child: Container(
              color: Colors.transparent,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: []..addAll(
                    new List.generate(
                        indexing.length, (index) => _getIndexItem(index)),
                  ),
              ),
            ),
          ),
        ),
      ]);
    }));
  }

  _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if ((_offsetContainer + details.delta.dy) >= 0 &&
          (_offsetContainer + details.delta.dy) <=
              (_sizeHeightContainer - _heightScroller)) {
        _offsetContainer += details.delta.dy;
        posSelected =
            ((_offsetContainer / _heightScroller) % indexing.length).round();
        _text = indexing[posSelected];
        if (_text != _oldText) {
          for (var i = 0; i < countries.length; i++) {
            if (_text
                    .toString()
                    .compareTo(countries[i].name.toUpperCase()[0]) ==
                0) {
              var newOffset = i * _rowHeight;
              var maxScrollExtent = _controller.position.maxScrollExtent;
              _controller.jumpTo(
                  newOffset > maxScrollExtent ? maxScrollExtent : newOffset);
              break;
            }
          }
          _oldText = _text;
        }
      }
    });
  }

  _onVerticalDragStart(DragStartDetails details) {
    _offsetContainer = details.globalPosition.dy - diff;
  }

  _getIndexItem(int index) {
    return new Expanded(
      child: new Container(
        width: 40,
        height: 20,
        alignment: Alignment.center,
        child: new Text(indexing[index],
            style: new TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
