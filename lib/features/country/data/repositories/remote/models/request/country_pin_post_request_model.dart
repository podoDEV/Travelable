import '../../../../../../../core/networking/mappable.dart';

class CountryPinPostRequestModel extends RequestMappable {
  final String countryId;

  CountryPinPostRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
