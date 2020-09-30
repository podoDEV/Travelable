import 'package:dartz/dartz.dart';
import 'package:emergency/core/error/exceptions.dart';
import 'package:emergency/core/error/failures.dart';
import 'package:emergency/core/networking/network_info.dart';
import 'package:emergency/features/country/data/datasources/country_local_data_source.dart';
import 'package:emergency/features/country/data/datasources/country_remote_data_source.dart';
import 'package:emergency/features/country/data/repositories/country_repository_impl.dart';
import 'package:emergency/features/country/domain/entities/country.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements CountryLocalDataSource {}

class MockRemoteDataSource extends Mock implements CountryRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  CountryRepositoryImpl repository;
  MockLocalDataSource mockLocalDataSource;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CountryRepositoryImpl(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group("countries", () {
    final tCountries = [Country(), Country()];

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      repository.countries();

      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCountries())
            .thenAnswer((_) async => tCountries);

        // act
        final result = await repository.countries();

        // assert
        verify(mockRemoteDataSource.getCountries());
        expect(result, equals(Right(tCountries)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCountries())
            .thenAnswer((_) async => tCountries);

        // act
        await repository.countries();

        // assert
        verify(mockRemoteDataSource.getCountries());
        verify(mockLocalDataSource.insertCountries(tCountries));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCountries()).thenThrow(ServerException());

        // act
        final result = await repository.countries();

        // assert
        verify(mockRemoteDataSource.getCountries());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getCountries())
              .thenAnswer((_) async => tCountries);

          // act
          final result = await repository.countries();

          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getCountries());
          expect(result, equals(Right(tCountries)));
        },
      );

      test(
        'should return CacheFailure data when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getCountries()).thenThrow(CacheException());

          // act
          final result = await repository.countries();

          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getCountries());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group("countryById", () {
    final id = '12';
    final tCountry = Country(id: 12);
    // final tCountries = [, Country(id: '23')];

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      repository.countryBy(id: id);

      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCountryBy(id))
            .thenAnswer((_) async => tCountry);

        // act
        final result = await repository.countryBy(id: id);

        // assert
        verify(mockRemoteDataSource.getCountryBy(id));
        expect(result, equals(Right(tCountry)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCountryBy(id))
            .thenAnswer((_) async => tCountry);

        // act
        await repository.countryBy(id: id);

        // assert
        verify(mockRemoteDataSource.getCountryBy(id));
        verify(mockLocalDataSource.updateCountry(tCountry));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCountryBy(id))
            .thenThrow(ServerException());

        // act
        final result = await repository.countryBy(id: id);

        // assert
        verify(mockRemoteDataSource.getCountryBy(id));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getCountryBy(id))
              .thenAnswer((_) async => tCountry);

          // act
          final result = await repository.countryBy(id: id);

          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getCountryBy(id));
          expect(result, equals(Right(tCountry)));
        },
      );

      test(
        'should return CacheFailure data when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getCountryBy(id))
              .thenThrow(CacheException());

          // act
          final result = await repository.countryBy(id: id);

          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getCountryBy(id));
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
