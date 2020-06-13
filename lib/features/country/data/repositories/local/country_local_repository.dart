import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/entities/country.dart';
import '../../../domain/entities/notice.dart';
import '../../datasources/country_local_data_source.dart';
import 'commands/new_countries_command.dart';

class CountryLocalRepository implements CountryLocalDataSource {
  final Future<Database> database = getDatabasesPath().then((path) {
    return openDatabase(join(path, 'emergence_database.db'),
        onCreate: (db, version) {
      return db.execute(NewCountriesCommand().query);
    }, version: 1);
  });

  @override
  Future<List<Country>> getCountries() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query("countries");
    return maps.map((e) => Country.fromMap(e)).toList();
  }

  @override
  Future<List<Country>> getPinnedCountries() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query("countries");
    return maps.map((e) => Country.fromMap(e)).toList();
  }

  @override
  Future<void> insertCountries(List<Country> countries) async {
    final Database db = await database;
    // await db.insert('countries', countries)
  }

  @override
  Future<void> updateCountry(Country country) {
    throw UnimplementedError();
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
  Future<void> insertNotices(List<Notice> notices) {
    throw UnimplementedError();
  }
}
