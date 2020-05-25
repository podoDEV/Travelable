import '../domain/usecases/get_all_countries_usecase.dart';
import '../domain/usecases/get_all_notices_usecase.dart';
import '../domain/usecases/get_country_usecase.dart';
import '../domain/usecases/search_countries_usecase.dart';
import 'country_module_factory.dart';

class CountryUseCaseFactory {

  static GetAllCountriesUseCase getAllCountriesUseCase
    = GetAllCountriesUseCase(CountryModuleFactory.countryRepository);

  static GetCountryUseCase getCountryUseCase
    = GetCountryUseCase(CountryModuleFactory.countryRepository);
  
  static GetAllNoticesUseCase getAllNoticesUseCase
    = GetAllNoticesUseCase(CountryModuleFactory.countryRepository);

  static SearchCountriesUseCase searchCountriesUseCase
    = SearchCountriesUseCase(CountryModuleFactory.countryRepository);
}

