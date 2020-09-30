import '../../domain/entities/country.dart';
import '../../domain/entities/notice.dart';

abstract class CountryRemoteDataSource {
  /// Calls the /api/countries endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<Country>> getCountries();

  Future<List<Country>> getPinnedCountries();

  /// Calls the /api/countries/{countryId} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Country> getCountryBy(int countryId);

  Future<void> pinCountry(int countryId);

  Future<void> unpinCountry(int countryId);

  Future<List<Notice>> getNotices();
}
