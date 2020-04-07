
import 'package:cloud_firestore/cloud_firestore.dart';

class Country {
  final String id;
  final String name;
  final String enName;
  final String contact;
  final String continent;
  final String imageUrl1;
  final String imageUrl2;
  Country(
    this.id, 
    this.name, 
    this.enName, 
    this.contact, 
    this.continent, 
    this.imageUrl1, 
    this.imageUrl2
  );

  Country.fromDocument(DocumentSnapshot doc)
  : this(
    doc["id"], 
    doc["name"], 
    doc["enName"], 
    doc["contact"], 
    doc["continent"], 
    doc["imageUrl1"], 
    doc["imageUrl2"]
  );
}