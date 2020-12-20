import 'package:emergency/features/country/data/repositories/remote/models/request/country_alarm_post_request_model.dart';

import '../../../../../../core/models/base_request.dart';
import '../../../../../../core/networking/content_encoding.dart';
import '../../../../../../core/networking/http_method.dart';

class CountryAlarmPostRequest extends BaseRequest {
  final CountryAlarmPostRequestModel requestModel;

  CountryAlarmPostRequest(this.requestModel);

  @override
  String get baseUrl => 'http://emergency.podo.world:8080/api';

  @override
  ContentEncoding get contentEncoding => ContentEncoding.json;

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
