import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const databaseName = "bytebank.db";

  Future<Database> getDatabase(String execute) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(execute);
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }
}
