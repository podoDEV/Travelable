import '../networking/http_header.dart';
import '../networking/http_method.dart';
import '../networking/http_request.dart';

abstract class BaseRequest implements HttpRequestProtocol {
  List<HTTPHeader> additionalHeaders = [];

  Map<String, String> get allHeaders {
    Map<String, String> allHeaders = this.headers;
    var additionalHeadersMap = Map<String, String>.fromIterable(additionalHeaders, key: (e) => e.key, value: (e) => e.value);
    allHeaders.addAll(additionalHeadersMap);
    return allHeaders;
  }

  String get queryParameters {
    if (method == HttpMethod.GET && parameters != null && parameters.isNotEmpty) {
      final jsonString = Uri(queryParameters: parameters);
      return '?${jsonString.query}';
    }

    return '';
  }

  @override
  void putAdditionalHeader(HTTPHeader header) {
    this.additionalHeaders.add(header);
  }
}