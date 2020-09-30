import 'package:flutter/material.dart';

class Tel {
  final String key;
  final String value;
  final Map<String, dynamic> names;

  Tel({this.key, this.value, this.names});

  factory Tel.fromMap(Map<String, dynamic> map) {
    return new Tel(key: map['key'], value: map['value'], names: map['names']);
  }

  String displayName() {
    return names['ko'];
  }

  String displayNumber() {
    if (value == null || value == "") {
      return "n/a";
    }
    return value;
  }

  Image displayImage() {
    if (key == 'police') {
      return Image.asset('images/ic_police.png');
    } else if (key == 'fire') {
      return Image.asset('images/ic_fire.png');
    } else if (key == 'ambulance') {
      return Image.asset('images/ic_hospital.png');
    }
    return Image.asset('images/ic_hospital.png');
  }

  String callNumber(String countryNumber) {
    return countryNumber + displayNumber();
  }

  static var mocks = [
    Tel(key: 'police', value: '112', names: {'ko': '경찰'}),
    Tel(key: 'fire', value: '119', names: {'ko': '소방서'}),
    Tel(key: 'ambulance', value: '119', names: {'ko': '앰뷸런스'}),
  ];
}
