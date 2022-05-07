import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql
        .getDatabasesPath(); // This is the folder where we are going to store the database in the device.

    final sqlDb = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)'); // db.excute - executes an SQL command
      },
      version: 1,
    );

    await sqlDb.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace,);
  }
}
