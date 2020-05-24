import 'package:emergency/data/repositories/remote/networking/http_header.dart';
import 'package:emergency/data/repositories/remote/networking/http_request.dart';
import 'package:emergency/data/repositories/remote/networking/plugin_type.dart';
import 'package:emergency/domain/usecases/user_usecase.dart';

class AuthPlugin implements PluginType {
  UserUseCase _userUseCase;

  AuthPlugin(this._userUseCase);

  @override
  HttpRequestProtocol prepare(HttpRequestProtocol request) {
    var accessToken = _userUseCase.accessToken;
    if (accessToken != null && accessToken.isNotEmpty) {
      request.putAdditionalHeader(
          HTTPHeader("Authorization", "bearer $accessToken"));
    }
    return request;
  }
}
