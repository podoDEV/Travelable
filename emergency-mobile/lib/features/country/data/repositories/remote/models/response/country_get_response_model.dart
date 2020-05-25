import '../../../../../domain/entities/country.dart';

class CountryGetResponseModel {
  Country country;

  CountryGetResponseModel({this.country});

  factory CountryGetResponseModel.fromMap(Map<String, dynamic> map) =>
      new CountryGetResponseModel(country: Country.fromMap(map));
}
