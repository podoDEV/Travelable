import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/country.dart';
import '../repositories/country_repository.dart';

class SearchCountriesUseCase implements UseCase<List<Country>, SearchParams> {
  final CountryRepository repository;

  SearchCountriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Country>>> call(SearchParams params) async {
    return await repository.countriesBy(name: params.name);
  }
}

class SearchParams extends Equatable {
  final String name;

  SearchParams(this.name);

  @override
  List<Object> get props => throw UnimplementedError();
}
