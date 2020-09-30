import 'package:dartz/dartz.dart';
import 'package:emergency/features/country/domain/entities/country.dart';
import 'package:emergency/features/country/domain/repositories/country_repository.dart';
import 'package:emergency/features/country/domain/usecases/get_country_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCountryRepository extends Mock implements CountryRepository {}

void main() {
  GetCountryUseCase usecase;
  MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    usecase = GetCountryUseCase(mockCountryRepository);
  });

  final id = "12";
  final tCountries = [Country(id: 12), Country(id: 23)];

  test(
    'should get the country from the repository',
    () async {
      // arrange
      when(mockCountryRepository.countryBy(id: id))
          .thenAnswer((_) async => Right(tCountries.first));

      // act
      final result = await usecase(GetCountryParams(id));

      // assert
      expect(result, Right(tCountries.first));
      verify(mockCountryRepository.countryBy(id: id));
      verifyNoMoreInteractions(mockCountryRepository);
    },
  );
}
