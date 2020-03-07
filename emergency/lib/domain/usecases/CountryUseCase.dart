
import 'package:emergency/domain/entities/Country.dart';

abstract class CountryUseCase { 

  Future<List<Country>> allCountries();
  Future<List<Country>> reservedCountries();
  Future<List<Country>> searchCountries(String name);

  void reserveTrip(Country country, DateTime from, DateTime to);
  void cancelReservation(Country country);
}