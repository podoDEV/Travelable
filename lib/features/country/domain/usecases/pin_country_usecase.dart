import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/country_repository.dart';

class PinCountryUseCase implements UseCase<void, PinCountryParams> {
  final CountryRepository repository;

  PinCountryUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(PinCountryParams params) async {
    return await repository.pinCountry(id: params.id);
  }
}

class PinCountryParams {
  final int id;

  PinCountryParams(this.id);
}
