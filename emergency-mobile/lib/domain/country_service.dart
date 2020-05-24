import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/repositories/country_repository_type.dart';
import 'package:emergency/domain/usecases/country_usecase.dart';

import 'entities/notice.dart';

class CountryService extends CountryUseCase {
  final CountryRepositoryType countryRepository;

  List<Country> countries = [];

  CountryService(this.countryRepository);

  @override
  Future<List<Country>> allCountries() async {
    if (this.countries.isNotEmpty) {
      return this.countries;
    }

    var countries = await countryRepository.countries();
    this.countries = countries;
    return countries;
  }

  @override
  Future<Country> country(String countryId) async {
    var country = await countryRepository.countriesBy(countryId);
    return country;
  }

  @override
  Future<void> pin(String countryId) {
    return countryRepository.pinCountry(countryId);
  }

  @override
  Future<void> unpin(String countryId) {
    return countryRepository.unpinCountry(countryId);
  }

  @override
  Future<List<Country>> searchByName(String name) async {
    var countries = await this.allCountries();
    return countries.where((f) => f.name.startsWith(name));
  }

  @override
  Future<List<Notice>> notices() async {
    var notices = await countryRepository.notices();
    return notices;
  }
}
