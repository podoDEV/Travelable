import 'package:emergency/data/repositories/local/commands/database_command.dart';

class NewCountriesCommand extends DatabaseCommand {
  @override
  int get version => 1;

  @override
  String get query =>
      "CREATE TABLE countries(id INTEGER PRIMARY KEY, name TEXT)";
}
