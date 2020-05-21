import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/entities/notice.dart';

abstract class CountryRepositoryType {
  Future<List<Country>> countries();

  Future<Country> countriesBy(String countryId);

  Future<bool> pinCountry(String countryId);

  Future<bool> unpinCountry(String countryId);

  Future<List<Notice>> notices();
}
