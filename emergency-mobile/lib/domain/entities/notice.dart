class Notice {
  final int id;

  Notice({this.id});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return new Notice(id: json['id']);
  }
}
