import '../../../../../../../core/networking/mappable.dart';

class CountriesGetRequestModel extends RequestMappable {
  @override
  Map<String, dynamic> toJson() => {"size": "20000"};
}
