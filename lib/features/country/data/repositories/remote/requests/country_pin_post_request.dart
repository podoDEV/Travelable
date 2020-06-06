import '../../../../../../core/models/base_request.dart';
import '../../../../../../core/networking/content_encoding.dart';
import '../../../../../../core/networking/http_method.dart';
import '../models/request/country_pin_post_request_model.dart';

class CountryPinPostRequest extends BaseRequest {
  final CountryPinPostRequestModel requestModel;

  CountryPinPostRequest(this.requestModel);

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
  String get path => '/countries/${requestModel.countryId}/pin';
}
