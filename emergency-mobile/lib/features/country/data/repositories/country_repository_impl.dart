import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/networking/network_info.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/notice.dart';
import '../../domain/repositories/country_repository.dart';
import '../datasources/country_local_data_source.dart';
import '../datasources/country_remote_data_source.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryLocalDataSource localDataSource;
  final CountryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  List<Country> cachedCountries = [];
  List<Notice> cachedNotices = [];

  CountryRepositoryImpl({
    @required this.localDataSource, 
    @required this.remoteDataSource, 
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Country>>> countries() async {
    var countries = [Country(name: "가나"), Country(name: "가나다"), Country(name: "나라"), Country(name: "다리미"), Country(name: "마늘"), Country(name: "바다"), Country(name: "사자"), Country(name: "아기"), Country(name: "자전거"), Country(name: "차콜"), Country(name: "카메라"), Country(name: "타잔"), Country(name: "파도"), Country(name: "하늘")];
    return Right(countries);
    if (await networkInfo.isConnected) {
      try {
        final countries = await remoteDataSource.getCountries();
        localDataSource.insertCountries(countries);
        cachedCountries = countries;
        return Right(countries);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final countries = await localDataSource.getCountries();
        if (cachedCountries.isEmpty) {
          cachedCountries = countries;
        }
        return Right(countries);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Country>>> countriesBy({String name}) async {
    // TODO: - Search 고도화
    if (cachedCountries.isNotEmpty) {
      return Right(cachedCountries.where((e) => e.name.contains(name)).toList());
    }

    if (await networkInfo.isConnected) {
      try {
        final countries = await remoteDataSource.getCountries();
        localDataSource.insertCountries(countries);
        cachedCountries = countries;
        return Right(countries.where((e) => e.name.contains(name)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final countries = await localDataSource.getCountries();
        if (cachedCountries.isEmpty) {
          cachedCountries = countries;
        }
        return Right(countries.where((e) => e.name.contains(name)));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Country>> countryBy({String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final country = await remoteDataSource.getCountryBy(id);
        localDataSource.updateCountry(country);
        if (cachedCountries.isNotEmpty) {
          var replaceIndex = cachedCountries.indexWhere((e) => e.id == country.id); 
          if (replaceIndex >= 0) cachedCountries[replaceIndex] = country;
        }
        return Right(country);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final country = await localDataSource.getCountryBy(id);
        return Right(country);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> pinCountry({String id}) {
    return remoteDataSource.pinCountry(id);
  }

  @override
  Future<Either<Failure, void>> unpinCountry({String id}) {
    return remoteDataSource.unpinCountry(id);
  }

  @override
  Future<Either<Failure, List<Notice>>> notices() async {
    if (await networkInfo.isConnected) {
      try {
        final notices = await remoteDataSource.getNotices();
        localDataSource.insertNotices(notices);
        cachedNotices = notices;
        return Right(notices);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final notices = await localDataSource.getNotices();
        if (cachedNotices.isEmpty) {
          cachedNotices = notices;
        }
        return Right(notices);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
