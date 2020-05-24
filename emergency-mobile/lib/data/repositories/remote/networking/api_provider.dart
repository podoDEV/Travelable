import 'dart:convert';

import 'package:emergency/common/logger.dart';
import 'package:emergency/data/repositories/remote/networking/api_exception.dart';
import 'package:emergency/data/repositories/remote/networking/plugin_type.dart';
import 'package:http/http.dart';

import 'http_request.dart';

abstract class ApiProviderProtocol {
  Future<Map<String, dynamic>> send(HttpRequestProtocol req);
}

class EGApiProvider implements ApiProviderProtocol {
  final Client _client = Client();
  List<PluginType> _plugins = [];

  EGApiProvider([this._plugins]);

  Future<Map<String, dynamic>> send(HttpRequestProtocol req) async {
    final request = HttpRequest(req, _plugins);
    logger.d("REQUEST: $request");
    final response = await _client.send(request);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      logger.d("SUCCESS: $request");
      final data = await response.stream.transform(utf8.decoder).join();
      Map<String, dynamic> mappingData = json.decode(data);
      return mappingData;
    } else {
      logger.d("FAILURE: $request");
      throw EGApiException("${response.statusCode}", "Error retrieving data from the server.");
    }
  }
}
