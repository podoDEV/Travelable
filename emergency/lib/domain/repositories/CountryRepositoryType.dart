
import 'package:emergency/domain/entities/Country.dart';

abstract class CountryRepositoryType {
  
  Future<List<Country>> countries();
  Future<List<Country>> countriesBy(String userId);

  void removeCountryFromBy(String userId);
}