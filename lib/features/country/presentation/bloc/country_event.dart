part of 'country_bloc.dart';

@immutable
abstract class CountryEvent extends Equatable {
  CountryEvent([List props = const <dynamic>[]]) : super();
}

class GetCountrySearchResult extends CountryEvent {
  final String keyword;

  GetCountrySearchResult(this.keyword);

  @override
  List<Object> get props => [keyword];
}

class GetCountryDetail extends CountryEvent {
  final int countryId;

  GetCountryDetail(this.countryId);

  @override
  List<Object> get props => [countryId];
}

class GetPinnedCountries extends CountryEvent {
  GetPinnedCountries();

  @override
  List<Object> get props => [];
}

class PinCountry extends CountryEvent {
  final int countryId;

  PinCountry(this.countryId);

  @override
  List<Object> get props => [countryId];
}

class UnpinCountry extends CountryEvent {
  final int countryId;

  UnpinCountry(this.countryId);

  @override
  List<Object> get props => [countryId];
}
