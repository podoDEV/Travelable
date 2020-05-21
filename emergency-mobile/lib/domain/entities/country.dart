class Country {
  final int id;
  final String name;
  final bool pinned;

//  final String enName;
//  final String contact;
//  final String continent;
//  final String imageUrl1;
//  final String imageUrl2;

  Country({this.id, this.name, this.pinned});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
        id: json['id'],
        name: json['name'],
        pinned: json['pinned']
    );
  }
}
