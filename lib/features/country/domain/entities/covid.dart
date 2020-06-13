class Covid {
  final String totalConfirmCases;
  final String deltaConfirmCases;
  final String totalDeathToll;
  final DateTime updatedAt;

  Covid(
      {this.totalConfirmCases,
      this.deltaConfirmCases,
      this.totalDeathToll,
      this.updatedAt});

  factory Covid.fromMap(Map<String, dynamic> map) {
    return new Covid(
        totalConfirmCases: map['totalConfirmCases'],
        deltaConfirmCases: map['deltaConfirmCases'],
        totalDeathToll: map['totalDeathToll'],
        updatedAt: map['updatedAt']);
  }

  static var mock = Covid(
      totalConfirmCases: '22304',
      deltaConfirmCases: '289',
      totalDeathToll: '23',
      updatedAt: DateTime.now());
}
