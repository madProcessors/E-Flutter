import 'package:eflutter/utils/sqliteManager.dart';
import 'package:sqflite/sqflite.dart';

class Setting {
  int id;
  String description;
  String value;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'value': value,
    };
  }

  static Future<bool> update(Setting setting) async {
    Database db = await SqliteManager.reference;

    try {
      await db.update('settings', setting.toMap(), where: 'id = ?', whereArgs: [setting.id]);
    } catch (e) {
      return false;
    }

    return true;
  }

  // A method that retrieves all the dogs from the dogs table.
  static Future<List<Setting>> list() async {
    Database db = await SqliteManager.reference;
    Setting setting;

    // TEST
    // await db.delete('settings');
    // SqliteManager.initDB();

    // Query the table for all the Settings.
    final List<Map<String, dynamic>> maps = await db.query('settings');

    // Convert the List<Map<String, dynamic> into a List<Setting>.
    return List.generate(maps.length, (i) {
      setting = new Setting();
      setting.id = maps[i]['id'];
      setting.description = maps[i]['description'];
      setting.value = maps[i]['value'];
      return setting;
    });
  }
}
