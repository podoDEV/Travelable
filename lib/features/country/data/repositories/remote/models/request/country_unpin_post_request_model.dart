import '../../../../../../../core/networking/mappable.dart';

class CountryUnpinPostRequestModel extends RequestMappable {
  final int countryId;

  CountryUnpinPostRequestModel(this.countryId);

  @override
  Map<String, dynamic> toJson() => {};
}
