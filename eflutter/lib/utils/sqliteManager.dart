import 'package:eflutter/models/Setting.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteManager {
  static Database _db;

  static Future<Database >get reference async {
    WidgetsFlutterBinding.ensureInitialized();
    print('Starting DB connection');

    _db = await openDatabase(
      // Use join to ease multiplatform path resolution
      join(await getDatabasesPath(), 'axl.db'),
      // Create settings table and populate it when DB is created
      onCreate: (db, version) async {
        print('ENTRA A ON CREATE');
        return await initDB();
      },
      version: 1,
    );

    return _db;
  }

  static Future<void >initDB() async {
    Setting setting;
    setting = new Setting();

    await _db.execute(
      "CREATE TABLE settings(id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "description TEXT, value TEXT); "
    );

    try{
      setting.description = 'sounds';
      setting.value = '1';
      _db.insert(
        'settings',
        setting.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      setting.description = 'notifications';
      setting.value = '1';
      _db.insert(
        'settings',
        setting.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    catch(e){
    }
  }
}
