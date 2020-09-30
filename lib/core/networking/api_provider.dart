import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../error/exceptions.dart';
import '../logger.dart';
import 'api_exception.dart';
import 'http_request.dart';
import 'plugin_type.dart';

abstract class ApiProviderProtocol {
  Future<Map<String, dynamic>> send(HttpRequestProtocol req);
}

class EGApiProvider implements ApiProviderProtocol {
  final Client client;
  List<PluginType> _plugins = [];

  EGApiProvider(this.client, [this._plugins]);

  Future<Map<String, dynamic>> send(HttpRequestProtocol req) async {
    final request = HttpRequest(req, _plugins);

    logger.d("REQUEST: $request");
    try {
      final response = await client.send(request);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        logger.d("SUCCESS: $request");
        final data = await response.stream.transform(utf8.decoder).join();
        Map<String, dynamic> mappingData = json.decode(data);
        return mappingData;
      } else {
        logger.d("FAILURE: $request");
        throw EGApiException(
            "${response.statusCode}", "Error retrieving data from the server.");
      }
    } on TimeoutException {
      throw ServerException();
    } on SocketException {
      throw ServerException();
    }
  }
}
