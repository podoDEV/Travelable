
import 'package:emergency/domain/entities/Country.dart';

abstract class CountryRemoteDataSource {
  
  Future<List<Country>> getCountries();
  Future<List<Country>> getCountriesBy(String userId);
  
  void deleteCountryFromBy(String userId);
}