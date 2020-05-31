import 'package:dartz/dartz.dart';
import '../error/failures.dart';

class KeywordValidator {
  Either<Failure, String> validateSearchKeyword(String str) {
    return Right(str);
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object> get props => [];
}