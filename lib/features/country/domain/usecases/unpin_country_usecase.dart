import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/country_repository.dart';

class UnpinCountryUseCase implements UseCase<void, UnpinCountryParams> {
  final CountryRepository repository;

  UnpinCountryUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UnpinCountryParams params) async {
    return await repository.unpinCountry(id: params.id);
  }
}

class UnpinCountryParams {
  final int id;

  UnpinCountryParams(this.id);
}
