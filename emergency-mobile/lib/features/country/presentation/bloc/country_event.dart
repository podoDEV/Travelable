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