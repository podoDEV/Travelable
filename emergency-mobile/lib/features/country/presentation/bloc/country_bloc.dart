import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/keyword_validator.dart';
import '../../domain/entities/country.dart';
import '../../domain/usecases/search_countries_usecase.dart';

part 'country_event.dart';
part 'country_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALIDA_INPUT_FAILURE_MESSAGE = 'Failure';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final SearchCountriesUseCase searchCountriesUseCase;
  final KeywordValidator validator;

  CountryBloc({
    @required SearchCountriesUseCase searchCountries,
    @required this.validator
  })  : assert(searchCountries != null), 
        assert(validator != null),
        searchCountriesUseCase = searchCountries;

  @override
  CountryState get initialState => Empty();

  @override
  Stream<CountryState> mapEventToState(
    CountryEvent event,
  ) async* {
    if (event is GetCountrySearchResult) {
      final inputEither = validator.validateSearchKeyword(event.keyword);
      yield* inputEither.fold(
        (failure) async* {
          yield Error(message: INVALIDA_INPUT_FAILURE_MESSAGE);
        }, 
        (keyword) async* {
          yield Loading();
          final failureOrCountries = await searchCountriesUseCase(SearchParams(keyword));
          yield* _eitherLoadedOrErrorState(failureOrCountries);
        },
      );
    }
  }

  Stream<CountryState> _eitherLoadedOrErrorState(
    Either<Failure, List<Country>> failureOrCountries,
  ) async* {
    yield failureOrCountries.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)), 
      (countries) => Loaded(countries: countries)
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
