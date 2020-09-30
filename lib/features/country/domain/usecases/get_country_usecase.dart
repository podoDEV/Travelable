import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/country.dart';
import '../repositories/country_repository.dart';

class GetCountryUseCase implements UseCase<Country, GetCountryParams> {
  final CountryRepository repository;

  GetCountryUseCase(this.repository);

  @override
  Future<Either<Failure, Country>> call(GetCountryParams params) async {
    return await repository.countryBy(id: params.id);
  }
}

class GetCountryParams {
  final int id;

  GetCountryParams(this.id);
}
