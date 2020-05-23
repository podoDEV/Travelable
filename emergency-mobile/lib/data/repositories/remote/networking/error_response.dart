import 'mappable.dart';

class ErrorResponse implements ErrorMappable, BaseMappable {
  @override
  String description;

  @override
  String errorCode;

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    this.errorCode = json['error_code'];
    this.description = json['description'];

    return this;
  }
}
