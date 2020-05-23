import 'dart:convert';

import 'package:http/http.dart';

import 'http_request.dart';

abstract class ApiProviderProtocol {
  Future<Map<String, dynamic>> send(HttpRequestProtocol req);
}

class EGApiProvider implements ApiProviderProtocol {
  final Client _client;

  EGApiProvider(this._client);

  Future<Map<String, dynamic>> send(HttpRequestProtocol req) async {
    final request = HttpRequest(req);

    final response = await _client.send(request);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = await response.stream.transform(utf8.decoder).join();
      Map<String, dynamic> mappingData = json.decode(data);
      return mappingData;
    } else {
      final Map<String, dynamic> responseError = {
        "error_code": "${response.statusCode}",
        "description": "Error retrieving data from the server."
      };

      throw Error();

//      return ErrorResponse().fromJson(responseError);
    }
  }
}
