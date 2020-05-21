import 'package:emergency/data/repositories/remote/networking/mappable.dart';

class CountryUnpinPostRequestModel extends RequestMappable {
  final String countryId;

  CountryUnpinPostRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
