class Embassy {
  final String address;
  final String email;
  final String representativeNumber;
  final String emergencyNumber;
  final String description;

  Embassy(
      {this.address,
      this.email,
      this.representativeNumber,
      this.emergencyNumber,
      this.description});

  factory Embassy.fromMap(Map<String, dynamic> map) {
    return new Embassy(
        address: map['address'],
        email: map['email'],
        representativeNumber: map['representativeNumber'],
        emergencyNumber: map['emergencyNumber'],
        description: map['description']);
  }

  static var mock = Embassy(
      address:
          'No.10, Fifth Avenue Extension, Cantonments, P.O.Box GP 13700, Accra, Ghana',
      email: 'ghana@mofa.go.kr',
      representativeNumber: '302-771-705, 302-771-757, 776-157, 777-533',
      emergencyNumber: '244-321-858',
      description: '대사관 헤헷');
}
