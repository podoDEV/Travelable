import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/country.dart';
import '../repositories/country_repository.dart';

class GetAllCountriesUseCase implements UseCase<List<Country>, NoParams> {
  final CountryRepository repository;

  GetAllCountriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Country>>> call(NoParams params) async {
    return await repository.countries();
  }
}
