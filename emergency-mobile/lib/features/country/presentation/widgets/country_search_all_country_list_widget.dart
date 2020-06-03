import 'package:flutter/material.dart';

import '../../domain/entities/country.dart';

class CountrySearchAllCountryListWidget extends StatefulWidget {
  final List<Country> countries;

  const CountrySearchAllCountryListWidget({
    Key key,
    this.countries
  }) : super(key: key);

  @override
  _CountrySearchAllCountryListWidgetState createState() => _CountrySearchAllCountryListWidgetState(countries: countries);
}

class _CountrySearchAllCountryListWidgetState extends State<CountrySearchAllCountryListWidget> {
  final List<Country> countries;

  double _offsetContainer;
  var _text;
  var _oldText;
  var _heightscroller;
  var _itemsizeheight = 65.0; //NOTE: size items
  // var _marginRight=50.0;
  var _sizeheightcontainer;
  var posSelected = 0;
  var diff = 0.0;
  var height = 0.0;
  var txtSliderPos = 0.0;
  ScrollController _controller;
  String message = "";

  // List _alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  List _alphabet = ['가', '나', '다', '라', '마', '바', '사', '아', '자', '차', '카', '타', '파', '하'];

  _CountrySearchAllCountryListWidgetState({
    @required this.countries
  });

  @override
  void initState() {
    _offsetContainer = 0.0;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    return Expanded(
      child: 
    new LayoutBuilder(
      builder: (context, contrainsts) {
        diff = height - contrainsts.biggest.height;
        _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
        _sizeheightcontainer = (contrainsts.biggest.height); //NO
        return new Stack(children: [
          ListView.builder(
            itemCount: countries.length,
            controller: _controller,
            itemExtent: _itemsizeheight,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${countries[index].name}'
                  ),
                ),
              );
            },
          ),
          // Positioned(
          //   right: _marginRight,
          //   top: _offsetContainer,
          //   child: _getSpeechBubble(),
          // ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragStart: _onVerticalDragStart,
              child: Container(
                //height: 20.0 * 26,
                color: Colors.transparent,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: []..addAll(
                      new List.generate(_alphabet.length,
                          (index) => _getAlphabetItem(index)),
                    ),
                ),
              ),
            ),
          ),
        ]);
      }
    ));
    // return Expanded(
    //   child: ListView.separated(
    //     padding: EdgeInsets.only(top: 0),
    //     scrollDirection: Axis.vertical,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Container(
    //         height: 57.5,
    //         padding: EdgeInsets.all(14),
    //         color: Color.fromRGBO(255, 255, 255, 1),
    //         child: Row(children: <Widget>[
    //           Text(
    //             '${countries[index].name}'
    //           ),
    //         ]),
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index) {
    //       return Container(
    //         height: 1, 
    //         color: Color.fromRGBO(151, 151, 151, 0.1)
    //       );
    //     },
    //     itemCount: countries.length,
    //   )
    // );
  }

  //scroll detector for reached top or bottom
  _scrollListener() {
    if ((_controller.offset) >= (_controller.position.maxScrollExtent)) {
      print("reached bottom");
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print("reached top");
    }
  }

  _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if ((_offsetContainer + details.delta.dy) >= 0 &&
          (_offsetContainer + details.delta.dy) <=
              (_sizeheightcontainer - _heightscroller)) {
        _offsetContainer += details.delta.dy;
        posSelected =
            ((_offsetContainer / _heightscroller) % _alphabet.length).round();
        _text = _alphabet[posSelected];
        if (_text != _oldText) {
          for (var i = 0; i < countries.length; i++) {
            if (_text
                    .toString()
                    .compareTo(countries[i].name.toUpperCase()[0]) ==
                0) {
              _controller.jumpTo(i * _itemsizeheight);
              break;
            }
          }
          _oldText = _text;
        }
      }
    });
  }

  _onVerticalDragStart(DragStartDetails details) {
//    var heightAfterToolbar = height - diff;
//    print("height1 $heightAfterToolbar");
//    var remavingHeight = heightAfterToolbar - (20.0 * 26);
//    print("height2 $remavingHeight");
//
//    var reducedheight = remavingHeight / 2;
//    print("height3 $reducedheight");
    _offsetContainer = details.globalPosition.dy - diff;
  }

  _getAlphabetItem(int index) {
    return new Expanded(
      child: new Container(
        width: 40,
        height: 20,
        alignment: Alignment.center,
        child: new Text(
          _alphabet[index],
          style: (index == posSelected)
              ? new TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
              : new TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
