import '../../../../../../../core/networking/mappable.dart';

class CountryUnpinPostRequestModel extends RequestMappable {
  final String countryId;

  CountryUnpinPostRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
