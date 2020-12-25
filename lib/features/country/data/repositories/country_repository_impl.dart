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
  Future<Either<Failure, List<Country>>> pinnedCountries() async {
    // return Right(Country.mocks);
    if (await networkInfo.isConnected) {
      try {
        final countries = await remoteDataSource.getPinnedCountries();
        localDataSource.insertCountries(countries);
        // cachedCountries = countries;
        return Right(countries);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final countries = await localDataSource.getCountries();
        // if (cachedCountries.isEmpty) {
        //   cachedCountries = countries;
        // }
        return Right(countries);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Country>>> countriesBy({String name}) async {
    // TODO: - Search 고도화
    // return Right(Country.mocks);
    if (cachedCountries.isNotEmpty) {
      return Right(
          cachedCountries.where((e) => e.displayName.contains(name)).toList());
    } else {
      if (await networkInfo.isConnected) {
        try {
          final countries = await remoteDataSource.getCountries();
          localDataSource.insertCountries(countries);
          cachedCountries = countries;
          return Right(countries.where((e) => e.displayName.contains(name)));
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        try {
          final countries = await localDataSource.getCountries();
          if (cachedCountries.isEmpty) {
            cachedCountries = countries;
          }
          return Right(countries.where((e) => e.displayName.contains(name)));
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    }
  }

  @override
  Future<Either<Failure, void>> pinCountry({int id}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.pinCountry(id);
        return Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> unpinCountry({int id}) {
    return remoteDataSource.unpinCountry(id);
  }

  @override
  Future<Either<Failure, void>> setAlarm({int id, bool enabled}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.setAlarm(id, enabled);
        return Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
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
