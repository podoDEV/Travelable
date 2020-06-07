class Tel {
  final String key;
  final String number;
  final Map<String, String> names;

  Tel({this.key, this.number, this.names});

  factory Tel.fromMap(Map<String, dynamic> map) {
    return new Tel(key: map['key'], number: map['number'], names: map['names']);
  }

  static var mocks = [
    Tel(key: 'police', number: '112', names: {'ko': '경찰'}),
    Tel(key: 'fire', number: '119', names: {'ko': '소방서'}),
    Tel(key: 'ambulance', number: '119', names: {'ko': '앰뷸런스'}),
  ];
}
