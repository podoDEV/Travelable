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
}
