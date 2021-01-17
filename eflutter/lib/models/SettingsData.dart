import 'dart:collection';

import 'package:eflutter/models/Setting.dart';
import 'package:eflutter/utils/sqliteManager.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class SettingsData extends ChangeNotifier {
  List<Setting> _settings = [];

  SettingsData() {
    initSettings();
  }

  UnmodifiableListView<Setting> get settings {
    return UnmodifiableListView(_settings);
  }

  void initSettings() async {
    _settings = await Setting.list();
    notifyListeners();
  }

  int get settingsCount{
    return _settings.length;
  }

  void updateSetting(Setting setting) async {
    try{
      Database db = await SqliteManager.reference;
      setting.value = setting.value == '1' ? '0' : '1';
      await db.rawUpdate('UPDATE settings SET value = ? WHERE id = ?', [setting.value, setting.id]);
      notifyListeners();
    }
    catch(e){
      print('ERROR SettingsData: ' + e);
    }
  }
}
