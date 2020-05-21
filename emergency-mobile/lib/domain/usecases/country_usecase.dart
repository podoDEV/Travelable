import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/entities/notice.dart';

abstract class CountryUseCase {
  Future<List<Country>> allCountries();

  Future<Country> country(String countryId);

  Future<void> pin(String countryId);

  Future<void> unpin(String countryId);

  Future<List<Country>> searchByName(String name);

  Future<List<Notice>> notices();
}
