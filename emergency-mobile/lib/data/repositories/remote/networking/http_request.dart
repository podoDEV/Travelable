import 'dart:convert';
import 'dart:typed_data';

import 'package:emergency/data/repositories/remote/networking/http_header.dart';
import 'package:emergency/data/repositories/remote/networking/plugin_type.dart';
import 'package:http/http.dart';

import 'content_encoding.dart';
import 'http_method.dart';

abstract class HttpRequestProtocol {
  List<HTTPHeader> additionalHeaders;

  String get baseUrl;

  String get path;

  HttpMethod get method;

  Map<String, String> get headers;

  Map<String, String> get allHeaders;

  Map<String, dynamic> get parameters;

  ContentEncoding get contentEncoding;

  String get queryParameters;

  void putAdditionalHeader(HTTPHeader header);
}

class HttpRequest extends Request {
  HttpRequestProtocol request;

  HttpRequest(HttpRequestProtocol request, [List<PluginType> plugins])
      : super(
            request.method.value,
            Uri.parse(
                '${request.baseUrl}${request.path}${request.queryParameters}')) {
    if (plugins != null) {
      plugins.forEach((element) {
        request = element.prepare(request);
      });
    }
    this.request = request;
  }

  @override
  Map<String, String> get headers => this.request.allHeaders;

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
