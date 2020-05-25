import '../../../../../../../core/networking/mappable.dart';

class CountryGetRequestModel extends RequestMappable {
  final String countryId;

  CountryGetRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
