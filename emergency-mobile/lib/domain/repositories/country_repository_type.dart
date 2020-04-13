
import 'package:emergency/domain/entities/country.dart';

abstract class CountryRepositoryType {

  Future<List<Country>> countries();
  Future<List<Country>> countriesBy(String userId);

  void subscribe(Country country);
  void unsubscribe(Country country);
}