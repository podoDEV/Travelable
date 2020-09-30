class Covid {
  final int totalConfirmCases;
  final int deltaConfirmCases;
  final int totalDeathToll;
  final DateTime updatedAt;

  Covid(
      {this.totalConfirmCases,
      this.deltaConfirmCases,
      this.totalDeathToll,
      this.updatedAt});

  factory Covid.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return new Covid(
        totalConfirmCases: map['totalConfirmCases'],
        deltaConfirmCases: map['deltaConfirmCases'],
        totalDeathToll: map['totalDeathToll'],
        updatedAt: map['updatedAt']);
  }

  static var mock = Covid(
      totalConfirmCases: 22304,
      deltaConfirmCases: 289,
      totalDeathToll: 23,
      updatedAt: DateTime.now());
}
