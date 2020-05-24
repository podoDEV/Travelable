import 'package:emergency/data/repositories/remote/networking/http_request.dart';

abstract class PluginType {
  HttpRequestProtocol prepare(HttpRequestProtocol request);
}
