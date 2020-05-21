import 'package:emergency/data/repositories/remote/networking/mappable.dart';

class CountryPinPostRequestModel extends RequestMappable {
  final String countryId;

  CountryPinPostRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
