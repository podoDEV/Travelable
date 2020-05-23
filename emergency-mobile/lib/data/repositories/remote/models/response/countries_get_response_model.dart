import 'package:emergency/domain/entities/country.dart';

class CountriesGetResponseModel {
  List<Country> countries;

  CountriesGetResponseModel({this.countries});

  factory CountriesGetResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    return new CountriesGetResponseModel(
        countries: list.map((e) => Country.fromJson(e)).toList());
  }
}
