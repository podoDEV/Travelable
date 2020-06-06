import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

abstract class UserUseCase {
  String get accessToken;

  Future<void> login();
}

class LoginUseCase implements UseCase<void, NoParams> {
  final UserRepository repository;

  LoginUseCase(this.repository);
  
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.login();
  }
}
