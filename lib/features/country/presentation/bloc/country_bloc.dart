import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:emergency/features/country/domain/usecases/get_pinned_countries_usecase.dart';
import 'package:emergency/features/country/domain/usecases/pin_country_usecase.dart';
import 'package:emergency/features/country/domain/usecases/set_alarm_usecase.dart';
import 'package:emergency/features/country/domain/usecases/unpin_country_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/keyword_validator.dart';
import '../../domain/entities/country.dart';
import '../../domain/usecases/get_all_countries_usecase.dart';
import '../../domain/usecases/get_indexing_usecase.dart';
import '../../domain/usecases/search_countries_usecase.dart';

part 'country_event.dart';

part 'country_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Failure';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetAllCountriesUseCase allCountriesUseCase;
  final GetPinnedCountriesUseCase pinnedCountriesUseCase;
  final SearchCountriesUseCase searchCountriesUseCase;
  final PinCountryUseCase pinCountryUseCase;
  final UnpinCountryUseCase unpinCountryUseCase;
  final SetAlarmUseCase setAlarmUseCase;
  final GetIndexingUseCase indexing;
  final KeywordValidator validator;

  CountryBloc(
      {@required this.allCountriesUseCase,
      @required this.pinnedCountriesUseCase,
      @required this.searchCountriesUseCase,
      @required this.pinCountryUseCase,
      @required this.unpinCountryUseCase,
      @required this.setAlarmUseCase,
      @required GetIndexingUseCase indexingUseCase,
      @required this.validator})
      : assert(allCountriesUseCase != null),
        assert(pinnedCountriesUseCase != null),
        assert(searchCountriesUseCase != null),
        assert(pinCountryUseCase != null),
        assert(unpinCountryUseCase != null),
        assert(setAlarmUseCase != null),
        assert(indexingUseCase != null),
        assert(validator != null),
        indexing = indexingUseCase,
        super(Empty());

  // CountryState get initialState => Empty();

  @override
  Stream<CountryState> mapEventToState(
    CountryEvent event,
  ) async* {
    if (event is GetCountrySearchResult) {
      final inputEither = validator.validateSearchKeyword(event.keyword);
      yield* inputEither.fold(
        (failure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (keyword) async* {
          yield Loading();
          if (keyword.isEmpty) {
            final failureOrCountries = await allCountriesUseCase(NoParams());
            final failureOrIndexing = await indexing(NoParams());
            yield* _eitherAllLoadedOrErrorState(
                failureOrCountries, failureOrIndexing);
          } else {
            final failureOrCountries =
                await searchCountriesUseCase(SearchParams(keyword));
            yield* _eitherMatchingLoadedOrErrorState(failureOrCountries);
          }
        },
      );
    } else if (event is GetPinnedCountries) {
      final failureOrCountries = await pinnedCountriesUseCase(NoParams());
      yield* _eitherPinnedOrErrorState(failureOrCountries);
    } else if (event is PinCountry) {
      final failureOrResult =
          await pinCountryUseCase(PinCountryParams(event.countryId));
      yield* _eitherPinResultOrErrorState(failureOrResult);
    } else if (event is UnpinCountry) {
      final failureOrResult =
          await unpinCountryUseCase(UnpinCountryParams(event.countryId));
      yield* _eitherUnpinResultOrErrorState(failureOrResult);
    } else if (event is SetAlarmCountry) {
      final failureOrResult =
          await setAlarmUseCase(SetAlarmParams(event.countryId, event.enabled));
      yield* _eitherSetAlarmResultOrErrorState(failureOrResult);
    }
  }

  Stream<CountryState> _eitherAllLoadedOrErrorState(
    Either<Failure, List<Country>> failureOrCountries,
    Either<Failure, List<String>> failureOrIndexing,
  ) async* {
    yield* failureOrCountries.fold(
      (failure) async* {
        yield Error(message: _mapFailureToMessage(failure));
      },
      (countries) async* {
        yield* failureOrIndexing.fold((failure) async* {}, (indexing) async* {
          yield AllLoaded(countries: countries, indexing: indexing);
        });
      },
    );
  }

  Stream<CountryState> _eitherMatchingLoadedOrErrorState(
    Either<Failure, List<Country>> failureOrCountries,
  ) async* {
    yield failureOrCountries.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (countries) => MatchingLoaded(countries: countries));
  }

  Stream<CountryState> _eitherPinnedOrErrorState(
    Either<Failure, List<Country>> failureOrCountries,
  ) async* {
    yield failureOrCountries
        .fold((failure) => Error(message: _mapFailureToMessage(failure)),
            (countries) {
      if (countries.isEmpty) {
        return NoPinned();
      } else {
        return PinnedLoaded(countries: countries);
      }
    });
  }

  Stream<CountryState> _eitherDetailSheetOrErrorState(
    Either<Failure, Country> failureOrCountry,
  ) async* {
    yield failureOrCountry.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (country) => DetailSheet(country: country));
  }

  Stream<CountryState> _eitherPinResultOrErrorState(
    Either<Failure, void> failureOrResult,
  ) async* {
    yield failureOrResult.fold(
        (failure) => Error(message: ""), (result) => DetailSheetClosed());
  }

  Stream<CountryState> _eitherUnpinResultOrErrorState(
    Either<Failure, void> failureOrResult,
  ) async* {
    yield failureOrResult.fold(
        (failure) => Error(message: ""), (result) => DetailSheetClosed());
  }

  Stream<CountryState> _eitherSetAlarmResultOrErrorState(
    Either<Failure, void> failureOrResult,
  ) async* {
    yield failureOrResult.fold(
        (failure) => Error(message: ""), (result) => SetAlarmFinished());
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
