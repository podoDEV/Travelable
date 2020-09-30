import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/country.dart';
import '../../../bloc/country_bloc.dart';
import '../../../widgets/country_detail_bottom_sheet.dart';

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
  var _rowHeight = 38.0;

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
        ListView.builder(
          padding: EdgeInsets.only(top: 0),
          scrollDirection: Axis.vertical,
          controller: _controller,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // ignore: close_sinks
                final bloc = BlocProvider.of<CountryBloc>(context);
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return CountryDetailBottomSheet(
                          bloc: bloc, country: countries[index]);
                    });
              },
              child: Container(
                height: _rowHeight,
                padding: EdgeInsets.only(left: 34),
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Row(children: <Widget>[
                  Text(
                    countries[index].displayName,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(48, 48, 48, 1)),
                  ),
                ]),
              ),
            );
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
                    .compareTo(countries[i].displayName.toUpperCase()[0]) ==
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
        width: 46,
        height: 13,
        alignment: Alignment.center,
        child: new Text(indexing[index],
            style: new TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(116, 116, 116, 1))),
      ),
    );
  }
}
