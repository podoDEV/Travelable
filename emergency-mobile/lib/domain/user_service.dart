import 'package:emergency/domain/repositories/user_repository_type.dart';
import 'package:emergency/domain/usecases/user_usecase.dart';

class UserService extends UserUseCase {
  final UserRepositoryType userRepository;

  UserService(this.userRepository);

  @override
  String get accessToken => userRepository.accessToken;

  @override
  Future<void> login() => userRepository.login();
}
