import 'package:dartz/dartz.dart';
import 'package:emergency/core/usecases/usecase.dart';
import 'package:emergency/features/country/domain/entities/country.dart';
import 'package:emergency/features/country/domain/repositories/country_repository.dart';
import 'package:emergency/features/country/domain/usecases/get_all_countries_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCountryRepository extends Mock implements CountryRepository {}

void main() {
  GetAllCountriesUseCase usecase;
  MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    usecase = GetAllCountriesUseCase(mockCountryRepository);
  });

  final tCountries = [Country(), Country()];

  test(
    'should get all countries from the repository',
    () async {
      // arrange
      when(mockCountryRepository.countries())
          .thenAnswer((_) async => Right(tCountries));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, Right(tCountries));
      verify(mockCountryRepository.countries());
      verifyNoMoreInteractions(mockCountryRepository);
    },
  );
}