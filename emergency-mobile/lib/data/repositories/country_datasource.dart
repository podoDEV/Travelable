import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/entities/notice.dart';

abstract class CountryRemoteDataSource {
  Future<List<Country>> getCountries();

  Future<Country> getCountryBy(String countryId);

  Future<bool> pinCountry(String countryId);

  Future<bool> unpinCountry(String countryId);

  Future<List<Notice>> getNotices();
}
