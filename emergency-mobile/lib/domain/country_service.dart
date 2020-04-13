
import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/repositories/country_repository_type.dart';
import 'package:emergency/domain/repositories/user_repository_type.dart';
import 'package:emergency/domain/usecases/country_usecase.dart';

class CountryService extends CountryUseCase {

  CountryRepositoryType countryRepository;
  UserRepositoryType userRepository;
  CountryService(this.countryRepository, this.userRepository);

  @override
  Future<List<Country>> allCountries() async {
    var countries = await countryRepository.countries();
    return countries;
  }

  @override
  Future<List<Country>> subscribedCountries() async {
    var userId = await userRepository.userId();
    return countryRepository.countriesBy(userId);
  }

  @override
  Future<List<Country>> searchCountries(String name) async {
    var countries = await countryRepository.countries();
    return countries.where((f) => f.name.startsWith(name));
  }

  @override
  void subscribeNews(Country country, DateTime from, DateTime to) {
    countryRepository.subscribe(country);
  }

  @override
  void unsubscribe(Country country) {
    countryRepository.unsubscribe(country);
  }
}