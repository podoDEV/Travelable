class Notice {
  final int id;

  Notice({this.id});

  factory Notice.fromMap(Map<String, dynamic> map) {
    return new Notice(id: map['id']);
  }
}
