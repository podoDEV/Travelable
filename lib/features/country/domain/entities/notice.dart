class Notice {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;

  Notice({this.id, this.title, this.content, this.createdAt});

  factory Notice.fromMap(Map<String, dynamic> map) {
    return new Notice(id: map['id']);
  }
}
