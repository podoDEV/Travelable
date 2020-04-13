
import 'package:emergency/domain/entities/country.dart';

abstract class CountryRemoteDataSource {
  
  Future<List<Country>> getCountries();
  Future<List<Country>> getCountriesBy(String userId);
  
  void updateSubscription(Country country, bool subscribe);
}