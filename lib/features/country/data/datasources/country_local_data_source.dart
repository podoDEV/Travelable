import '../../domain/entities/country.dart';
import '../../domain/entities/notice.dart';

abstract class CountryLocalDataSource {
  /// Get the cached [List<Country>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<Country>> getCountries();

  Future<List<Country>> getPinnedCountries();

  Future<void> insertCountries(List<Country> countries);

  Future<void> updateCountry(Country country);

  Future<Country> getCountryBy(int countryId);

  Future<List<Notice>> getNotices();

  Future<void> insertNotices(List<Notice> notices);
}
