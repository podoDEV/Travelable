import 'database_command.dart';

class NewCountriesCommand extends DatabaseCommand {
  @override
  int get version => 1;

  @override
  String get query =>
      "CREATE TABLE countries(id INTEGER PRIMARY KEY, pinned INTEGER)";
}
