import 'package:dartz/dartz.dart';
import 'package:emergency/core/error/failures.dart';
import 'package:emergency/core/util/keyword_validator.dart';
import 'package:emergency/features/country/domain/entities/country.dart';
import 'package:emergency/features/country/domain/usecases/get_all_countries_usecase.dart';
import 'package:emergency/features/country/domain/usecases/get_country_usecase.dart';
import 'package:emergency/features/country/domain/usecases/get_indexing_usecase.dart';
import 'package:emergency/features/country/domain/usecases/search_countries_usecase.dart';
import 'package:emergency/features/country/presentation/bloc/country_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAllCountriesUseCase extends Mock implements GetAllCountriesUseCase {}

class MockCountryUseCase extends Mock implements GetCountryUseCase {}

class MockSearchCountriesUseCase extends Mock
    implements SearchCountriesUseCase {}

class MockIndexingUseCase extends Mock implements GetIndexingUseCase {}

class MockKeywordValidator extends Mock implements KeywordValidator {}

void main() {
  CountryBloc bloc;
  MockAllCountriesUseCase mockAllCountriesUseCase;
  MockCountryUseCase mockCountryUseCase;
  MockSearchCountriesUseCase mockSearchCountriesUseCase;
  MockIndexingUseCase mockIndexingUseCase;
  MockKeywordValidator mockKeywordValidator;

  setUp(() {
    mockAllCountriesUseCase = MockAllCountriesUseCase();
    mockCountryUseCase = MockCountryUseCase();
    mockSearchCountriesUseCase = MockSearchCountriesUseCase();
    mockIndexingUseCase = MockIndexingUseCase();
    mockKeywordValidator = MockKeywordValidator();

    bloc = CountryBloc(
        allCountriesUseCase: mockAllCountriesUseCase,
        countryUseCase: mockCountryUseCase,
        searchCountriesUseCase: mockSearchCountriesUseCase,
        indexingUseCase: mockIndexingUseCase,
        validator: mockKeywordValidator);
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(Empty()));
  });

  group("GetCountrySearchResult", () {
    final tKeyword = 'k';
    final List<Country> tCountries = [
      Country(names: {'en': 'korea'}),
    ];

    void setUpMockKeywordValidatorSuccess() =>
        when(mockKeywordValidator.validateSearchKeyword(any))
            .thenReturn(Right(tKeyword));

    test('should call the KeywordValidator to validate the string', () async {
      // arrange
      setUpMockKeywordValidatorSuccess();

      // act
      bloc.add(GetCountrySearchResult(tKeyword));
      await untilCalled(mockKeywordValidator.validateSearchKeyword(any));

      // assert
      verify(mockKeywordValidator.validateSearchKeyword(tKeyword));
    });

    test('should emit [Error] when the keyword is invalid', () async {
      // arrange
      when(mockKeywordValidator.validateSearchKeyword(any))
          .thenReturn(Left(InvalidInputFailure()));

      // assert later
      final expected = [Empty(), Error(message: INVALID_INPUT_FAILURE_MESSAGE)];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(GetCountrySearchResult(tKeyword));
    });

    test('should get data from the search use case', () async {
      // arrange
      setUpMockKeywordValidatorSuccess();
      when(mockSearchCountriesUseCase(any))
          .thenAnswer((_) async => Right(tCountries));

      // act
      bloc.add(GetCountrySearchResult(tKeyword));
      await untilCalled(mockSearchCountriesUseCase(any));

      // assert
      verify(mockSearchCountriesUseCase(SearchParams(tKeyword)));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      // arrange
      setUpMockKeywordValidatorSuccess();
      when(mockSearchCountriesUseCase(any))
          .thenAnswer((_) async => Right(tCountries));

      // assert later
      final expected = [
        Empty(),
        Loading(),
        MatchingLoaded(countries: tCountries),
      ];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(GetCountrySearchResult(tKeyword));
    });

    test('should emit [Loading, Error] when getting data fails', () async {
      // arrange
      setUpMockKeywordValidatorSuccess();
      when(mockSearchCountriesUseCase(any))
          .thenAnswer((_) async => Left(ServerFailure()));

      // assert later
      final expected = [
        Empty(),
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(GetCountrySearchResult(tKeyword));
    });

    test(
        'should emit [Loading, Error] with a proper message for the error when getting data fails',
        () async {
      // arrange
      setUpMockKeywordValidatorSuccess();
      when(mockSearchCountriesUseCase(any))
          .thenAnswer((_) async => Left(CacheFailure()));

      // assert later
      final expected = [
        Empty(),
        Loading(),
        Error(message: CACHE_FAILURE_MESSAGE),
      ];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(GetCountrySearchResult(tKeyword));
    });
  });
}
