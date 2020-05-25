import '../../domain/entities/country.dart';
import '../../domain/entities/notice.dart';

abstract class CountryRemoteDataSource {
  /// Calls the /api/countries endpoint.
  /// 
  /// Throws a [ServerException] for all error codes.
  Future<List<Country>> getCountries();

  /// Calls the /api/countries/{countryId} endpoint.
  /// 
  /// Throws a [ServerException] for all error codes.
  Future<Country> getCountryBy(String countryId);

  Future<void> pinCountry(String countryId);

  Future<void> unpinCountry(String countryId);

  Future<List<Notice>> getNotices();
}
