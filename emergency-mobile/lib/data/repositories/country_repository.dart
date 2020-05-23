import 'package:emergency/data/repositories/country_datasource.dart';
import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/entities/notice.dart';
import 'package:emergency/domain/repositories/country_repository_type.dart';

class CountryRepository implements CountryRepositoryType {
  CountryRemoteDataSource remoteDataSource;

  CountryRepository(this.remoteDataSource);

  @override
  Future<List<Country>> countries() {
    return remoteDataSource.getCountries();
  }

  @override
  Future<Country> countriesBy(String userId) {
    return remoteDataSource.getCountryBy(userId);
  }

  @override
  Future<bool> pinCountry(String countryId) {
    return remoteDataSource.pinCountry(countryId);
  }

  @override
  Future<bool> unpinCountry(String countryId) {
    return remoteDataSource.unpinCountry(countryId);
  }

  @override
  Future<List<Notice>> notices() {
    return remoteDataSource.getNotices();
  }
}
