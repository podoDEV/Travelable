import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/notice.dart';
import '../repositories/country_repository.dart';

class GetAllNoticesUseCase implements UseCase<List<Notice>, NoParams> {
  final CountryRepository repository;

  GetAllNoticesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Notice>>> call(NoParams params) async {
    return await repository.notices();
  }
}
