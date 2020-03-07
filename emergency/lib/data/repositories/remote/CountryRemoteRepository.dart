
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency/data/repositories/CountryDataSource.dart';
import 'package:emergency/domain/entities/Country.dart';

class CountryRemoteRepository implements CountryRemoteDataSource {
  
  Firestore firestore = Firestore.instance;

  @override
  Future<List<Country>> getCountries() async {
    QuerySnapshot querySnapshot = await firestore.collection("countries").getDocuments();
    var countries = querySnapshot.documents.map((f) => Country(f.data["name"])).toList();
    return countries;
  }

  @override
  Future<List<Country>> getCountriesBy(String userId) async {
    QuerySnapshot querySnapshot = await firestore.collection("countries").getDocuments();
    var countries = querySnapshot.documents.map((f) => Country(f.data["name"])).toList();
    return countries;
  }

  @override
  void deleteCountryFromBy(String userId) {
    firestore.collection("reservation").document(userId).delete();
  }
}