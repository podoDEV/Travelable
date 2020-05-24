import 'package:emergency/data/repositories/country_datasource.dart';
import 'package:emergency/data/repositories/remote/models/request/countries_get_request_model.dart';
import 'package:emergency/data/repositories/remote/models/request/country_get_request_model.dart';
import 'package:emergency/data/repositories/remote/models/request/country_pin_post_request_model.dart';
import 'package:emergency/data/repositories/remote/models/request/country_unpin_post_request_model.dart';
import 'package:emergency/data/repositories/remote/models/request/notices_get_request_model.dart';
import 'package:emergency/data/repositories/remote/models/response/countries_get_response_model.dart';
import 'package:emergency/data/repositories/remote/models/response/country_get_response_model.dart';
import 'package:emergency/data/repositories/remote/models/response/notices_get_response_model.dart';
import 'package:emergency/data/repositories/remote/requests/countries_get_request.dart';
import 'package:emergency/data/repositories/remote/requests/country_get_request.dart';
import 'package:emergency/data/repositories/remote/requests/country_pin_post_request.dart';
import 'package:emergency/data/repositories/remote/requests/country_unpin_post_request.dart';
import 'package:emergency/data/repositories/remote/requests/notices_get_request.dart';
import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/entities/notice.dart';

import 'networking/api_provider.dart';

class CountryRemoteRepository implements CountryRemoteDataSource {
  final ApiProviderProtocol provider;

  CountryRemoteRepository(this.provider);

  @override
  Future<List<Country>> getCountries() async {
    final requestModel = CountriesGetRequestModel();
    final response = await provider.send(CountriesGetRequest(requestModel));
    return CountriesGetResponseModel.fromMap(response).countries;
  }

  @override
  Future<Country> getCountryBy(String countryId) async {
    final requestModel = CountryGetRequestModel(countryId);
    final response = await provider.send(CountryGetRequest(requestModel));
    return CountryGetResponseModel.fromMap(response).country;
  }

  @override
  Future<bool> pinCountry(String countryId) async {
    final requestModel = CountryPinPostRequestModel(countryId);
    final response = await provider.send(CountryPinPostRequest(requestModel));
    return true;
  }

  @override
  Future<bool> unpinCountry(String countryId) async {
    final requestModel = CountryUnpinPostRequestModel(countryId);
    final response = await provider.send(CountryUnpinPostRequest(requestModel));
    return true;
  }

  @override
  Future<List<Notice>> getNotices() async {
    final requestModel = NoticesGetRequestModel();
    final response = await provider.send(NoticesGetRequest(requestModel));
    return NoticesGetResponseModel.fromMap(response).notices;
  }
}
