import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/country.dart';
import '../entities/notice.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<Country>>> countries();

  Future<Either<Failure, List<Country>>> pinnedCountries();

  Future<Either<Failure, List<Country>>> countriesBy({String name});

  Future<Either<Failure, Country>> countryBy({int id});

  Future<Either<Failure, void>> pinCountry({int id});

  Future<Either<Failure, void>> unpinCountry({int id});

  Future<Either<Failure, List<Notice>>> notices();
}
