abstract class UserUseCase {
  String get accessToken;

  Future<void> login();
}
