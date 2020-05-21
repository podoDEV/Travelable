import 'dart:convert';

abstract class RequestMappable {
  Map<String, dynamic> toJson();
}

abstract class Mappable {
  factory Mappable(Mappable type, String data) {
    if (type is BaseMappable) {
      Map<String, dynamic> mappingData = json.decode(data);
      return type.fromJson(mappingData);
    } else if (type is ListMappable) {
      Iterable iterableData = json.decode(data);
      return type.fromJsonList(iterableData);
    }

    return null;
  }
}

abstract class BaseMappable<T> implements Mappable {
  Mappable fromJson(Map<String, dynamic> json);
}

abstract class ListMappable<T> implements Mappable {
  Mappable fromJsonList(List<dynamic> json);
}

// Handler for the network's error response.
abstract class ErrorMappable implements BaseMappable {
  String errorCode;
  String description;
}
