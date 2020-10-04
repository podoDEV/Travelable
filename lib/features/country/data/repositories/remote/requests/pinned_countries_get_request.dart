import '../../../../../../core/models/base_request.dart';
import '../../../../../../core/networking/content_encoding.dart';
import '../../../../../../core/networking/http_method.dart';
import '../models/request/countries_get_request_model.dart';

class PinnedCountriesGetRequest extends BaseRequest {
  final CountriesGetRequestModel requestModel;

  PinnedCountriesGetRequest(this.requestModel);

  @override
  String get baseUrl => 'http://emergency.podo.world:8080/api';

  @override
  ContentEncoding get contentEncoding => ContentEncoding.url;

  @override
  Map<String, String> get headers => {
        "content-type": "application/json",
        "accept": "*/*",
      };

  @override
  HttpMethod get method => HttpMethod.GET;

  @override
  Map<String, dynamic> get parameters {
    Map<String, dynamic> params = requestModel.toJson();
    params.putIfAbsent('pinned', () => 'true');
    return params;
  }

  @override
  String get path => '/countries';
}
