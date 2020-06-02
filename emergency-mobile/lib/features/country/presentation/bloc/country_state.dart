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

  AllLoaded({@required this.countries}) : super(countries);

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

// class Searching extends CountryState {
//   final List<Country> countries;

//   Searching({@required this.countries}) : super(countries);

//   @override
//   List<Object> get props => countries;
// }

class Error extends CountryState {
  final String message;

  Error({@required this.message}) : super([message]);

  @override
  List<Object> get props => [message];
}