import 'http_request.dart';

abstract class PluginType {
  HttpRequestProtocol prepare(HttpRequestProtocol request);
}
