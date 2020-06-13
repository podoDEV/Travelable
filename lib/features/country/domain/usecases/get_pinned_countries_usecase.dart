import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/country.dart';
import '../repositories/country_repository.dart';

class GetPinnedCountriesUseCase implements UseCase<List<Country>, NoParams> {
  final CountryRepository repository;

  GetPinnedCountriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Country>>> call(NoParams params) async {
    return await repository.pinnedCountries();
  }
}
