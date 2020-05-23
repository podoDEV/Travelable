import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';

import 'content_encoding.dart';
import 'http_method.dart';

abstract class HttpRequestProtocol {
  String get baseUrl;

  String get path;

  HttpMethod get method;

  Map<String, String> get headers;

  Map<String, dynamic> get parameters;

  ContentEncoding get contentEncoding;

  String get queryParameters {
    if (method == HttpMethod.GET && parameters != null) {
      final jsonString = Uri(queryParameters: parameters);
      return '?${jsonString.query}';
    }

    return '';
  }
}

class HttpRequest extends Request {
  final HttpRequestProtocol request;

  HttpRequest(this.request)
      : super(
            request.method.value,
            Uri.parse(
                '${request.baseUrl}${request.path}${request.queryParameters}'));

  @override
  Map<String, String> get headers => this.request.headers;

  @override
  String get body => json.encode(this.request.parameters);

  @override
  Uint8List get bodyBytes {
    if (request.parameters == null) {
      return new Uint8List(0);
    }

    if (request.contentEncoding == ContentEncoding.url) {
      final queryParameters = Uri(queryParameters: request.parameters);
      List<int> bodyBytes = utf8.encode(queryParameters.query);

      return bodyBytes;
    } else {
      final encodedBody = Utf8Codec().encode(body);
      return Uint8List.fromList(encodedBody);
    }
  }
}
