class Covid {
  final String total;
  final String died;
  final String today;
  final DateTime updatedAt;

  Covid({this.total, this.died, this.today, this.updatedAt});

  factory Covid.fromMap(Map<String, dynamic> map) {
    return new Covid(
        total: map['total'],
        died: map['died'],
        today: map['today'],
        updatedAt: map['updatedAt']);
  }

  static var mock = Covid(
      total: '22304', died: '289', today: '23', updatedAt: DateTime.now());
}
