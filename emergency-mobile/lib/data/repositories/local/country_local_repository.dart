import 'package:emergency/data/repositories/country_datasource.dart';
import 'package:emergency/data/repositories/local/commands/new_countries_command.dart';
import 'package:emergency/domain/entities/country.dart';
import 'package:emergency/domain/entities/notice.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CountryLocalRepository implements CountryLocalDataSource {
  final Future<Database> database = getDatabasesPath().then((path) {
    return openDatabase(join(path, 'emergence_database.db'),
        onCreate: (db, version) {
      return db.execute(NewCountriesCommand().query);
    }, version: 1);
  });

  Future<void> insertCountries(List<Country> countries) async {
    final Database db = await database;
    // await db.insert('countries', countries)
  }

  @override
  Future<List<Country>> getCountries() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query("countries");
    return maps.map((e) => Country.fromMap(e)).toList();
  }

  @override
  Future<Country> getCountryBy(String countryId) async {
    final Database db = await database;
    final List<Map> maps =
        await db.query("countries", where: 'id = ?', whereArgs: [countryId]);
    if (maps.length > 0) {
      return Country.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<List<Notice>> getNotices() {
    throw UnimplementedError();
  }

  @override
  Future<bool> pinCountry(String countryId) {
    throw UnimplementedError();
  }

  @override
  Future<bool> unpinCountry(String countryId) {
    throw UnimplementedError();
  }
}
