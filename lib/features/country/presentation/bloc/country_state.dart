part of 'country_bloc.dart';

@immutable
abstract class CountryState extends Equatable {
  CountryState([List props = const <dynamic>[]]) : super();
}

class Empty extends CountryState {
  @override
  List<Object> get props => [];
}

class Loading extends CountryState {
  @override
  List<Object> get props => [];
}

class AllLoaded extends CountryState {
  final List<Country> countries;
  final List<String> indexing;

  AllLoaded({@required this.countries, @required this.indexing})
      : super(countries);

  @override
  List<Object> get props => countries;
}

class MatchingLoaded extends CountryState {
  final List<Country> countries;

  MatchingLoaded({@required this.countries}) : super(countries);

  @override
  List<Object> get props => countries;
}

class NoMatching extends CountryState {
  @override
  List<Object> get props => [];
}

class Error extends CountryState {
  final String message;

  Error({@required this.message}) : super([message]);

  @override
  List<Object> get props => [message];
}
