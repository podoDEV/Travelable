import 'package:emergency/data/repositories/remote/models/request/base_request.dart';
import 'package:emergency/data/repositories/remote/models/request/login_request_model.dart';
import 'package:emergency/data/repositories/remote/networking/content_encoding.dart';
import 'package:emergency/data/repositories/remote/networking/http_method.dart';

class LoginRequest extends BaseRequest {
  final LoginRequestModel requestModel;

  LoginRequest(this.requestModel);

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
  String get path => '/members/login';
}
