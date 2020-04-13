
import 'package:emergency/data/repositories/country_datasource.dart';
import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/repositories/country_repository_type.dart';

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
  void subscribe(Country country) {
    remoteDataSource.updateSubscription(country, true);
  }

  @override
  void unsubscribe(Country country) {
    remoteDataSource.updateSubscription(country, false);
  }
}