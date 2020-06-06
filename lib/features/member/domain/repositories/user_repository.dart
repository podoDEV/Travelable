import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class UserRepository {
  String get accessToken;

  Future<Either<Failure, void>> login();
}
