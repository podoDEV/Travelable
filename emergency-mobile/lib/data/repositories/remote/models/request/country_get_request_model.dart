import 'package:emergency/data/repositories/remote/networking/mappable.dart';

class CountryGetRequestModel extends RequestMappable {
  final String countryId;

  CountryGetRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
