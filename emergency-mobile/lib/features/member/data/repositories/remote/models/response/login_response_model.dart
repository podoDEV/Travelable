class LoginResponseModel {
  String accessToken;

  LoginResponseModel({this.accessToken});

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return new LoginResponseModel(accessToken: map['data']['accessToken']);
  }
}
