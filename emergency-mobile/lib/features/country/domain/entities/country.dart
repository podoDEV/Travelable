class Country {
  final String id;
  final String name;
  final bool pinned;

//  final String enName;
//  final String contact;
//  final String continent;
//  final String imageUrl1;
//  final String imageUrl2;

  Country({this.id, this.name, this.pinned});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'pinned': pinned};
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return new Country(id: map['id'], name: map['name'], pinned: map['pinned']);
  }

  static var mocks = [
    Country(name: "가나"),
    Country(name: "가나다"),
    Country(name: "가나다라"),
    Country(name: "나가"),
    Country(name: "나라"),
    Country(name: "다리미"),
    Country(name: "다시"),
    Country(name: "마늘"),
    Country(name: "바다"),
    Country(name: "사자"),
    Country(name: "아기"),
    Country(name: "자전거"),
    Country(name: "차콜"),
    Country(name: "카메라"),
    Country(name: "타잔"),
    Country(name: "파도"),
    Country(name: "하늘")
  ];
}
