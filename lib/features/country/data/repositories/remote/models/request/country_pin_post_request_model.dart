import '../../../../../../../core/networking/mappable.dart';

class CountryPinPostRequestModel extends RequestMappable {
  final int countryId;

  CountryPinPostRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
