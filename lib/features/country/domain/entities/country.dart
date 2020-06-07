import 'embassy.dart';
import 'notice.dart';
import 'tel.dart';

class Country {
  final String id;
  final Map<String, String> names;
  final bool pinned;
  final String countryNumber;
  final List<Tel> tels;
  final Embassy embassy;
  final String link;
  final List<Notice> notices;

  String get displayName {
    if (names == null) {
      return '';
    }
    return names['ko'];
  }

  Country(
      {this.id,
      this.names,
      this.pinned,
      this.countryNumber,
      this.tels,
      this.embassy,
      this.link,
      this.notices});

  Map<String, dynamic> toMap() {
    return {'id': id, 'names': names, 'pinned': pinned};
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    var telsMap = map['tels'] as List;
    if (telsMap == null) {
      telsMap = [];
    }

    var noticesMap = map['notices'] as List;
    if (noticesMap == null) {
      noticesMap = [];
    }

    return new Country(
        id: map['id'],
        names: map['names'],
        pinned: map['pinned'],
        countryNumber: map['countryNumber'],
        tels: telsMap.map((e) => Tel.fromMap(e)).toList(),
        embassy: Embassy.fromMap(map['embassy']),
        link: map['link'],
        notices: noticesMap.map((e) => Notice.fromMap(e)).toList());
  }

  static var mocks = [
    Country(
        names: {'ko': '가나'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '가나다'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '가나다라'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '나가'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '나라'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '다리미'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '다시'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '마늘'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '바다'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '사자'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '아기'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '자전거'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '차콜'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '카메라'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '타잔'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '파도'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com'),
    Country(
        names: {'ko': '하늘'},
        countryNumber: '123-123',
        tels: Tel.mocks,
        embassy: Embassy.mock,
        link: 'https://google.com')
  ];
}
