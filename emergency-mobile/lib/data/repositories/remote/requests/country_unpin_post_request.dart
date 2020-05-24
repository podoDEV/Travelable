import 'package:emergency/data/repositories/remote/models/request/base_request.dart';
import 'package:emergency/data/repositories/remote/models/request/country_unpin_post_request_model.dart';
import 'package:emergency/data/repositories/remote/networking/content_encoding.dart';
import 'package:emergency/data/repositories/remote/networking/http_method.dart';

class CountryUnpinPostRequest extends BaseRequest {
  final CountryUnpinPostRequestModel requestModel;

  CountryUnpinPostRequest(this.requestModel);

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
  HttpMethod get method => HttpMethod.POST;

  @override
  Map<String, dynamic> get parameters => requestModel.toJson();

  @override
  String get path => '/countries/${requestModel.countryId}/unpin';
}
