
import 'package:emergency/domain/entities/Country.dart';

abstract class CountryUseCase { 

  Future<List<Country>> allCountries();
  Future<List<Country>> subscribedCountries();
  Future<List<Country>> searchCountries(String name);

  void subscribeNews(Country country, DateTime from, DateTime to);
  void unsubscribe(Country country);
}