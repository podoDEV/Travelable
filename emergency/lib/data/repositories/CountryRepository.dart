
import 'package:emergency/data/repositories/CountryDataSource.dart';
import 'package:emergency/domain/entities/Country.dart';
import 'package:emergency/domain/repositories/CountryRepositoryType.dart';

class CountryRepository implements CountryRepositoryType {

  CountryRemoteDataSource remoteDataSource;
  CountryRepository(this.remoteDataSource);

  @override
  Future<List<Country>> countries() {
    return remoteDataSource.getCountries();
  }

  @override
  Future<List<Country>> countriesBy(String userId) {
    return remoteDataSource.getCountriesBy(userId);
  }

  @override
  void removeCountryFromBy(String userId) {
    remoteDataSource.deleteCountryFromBy(userId);
  }
}