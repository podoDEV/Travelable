import '../../../../../domain/entities/country.dart';

class CountriesGetResponseModel {
  List<Country> countries;

  CountriesGetResponseModel({this.countries});

  factory CountriesGetResponseModel.fromMap(Map<String, dynamic> map) {
    var list = map['data'] as List;
    return new CountriesGetResponseModel(
        countries: list.map((e) => Country.fromMap(e)).toList());
  }
}
