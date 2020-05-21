import 'package:emergency/domain/entities/country.dart';

class CountryGetResponseModel {
  Country country;

  CountryGetResponseModel({this.country});

  factory CountryGetResponseModel.fromJson(Map<String, dynamic> json) =>
      new CountryGetResponseModel(country: Country.fromJson(json));
}
