import 'dart:collection';

import 'package:eflutter/models/Setting.dart';
import 'package:eflutter/utils/sqliteManager.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsData extends ChangeNotifier {
  List<Setting> _settings = [];
  FirebaseUser _user;

  SettingsData() {
    initSettings();
  }

  // Local settings
  UnmodifiableListView<Setting> get settings {
    return UnmodifiableListView(_settings);
  }

  void initSettings() async {
    try{
      _settings = await Setting.list();
    }
    catch(e){
      _settings = null;
      _user = null;
    }
    notifyListeners();
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

  set setUser(FirebaseUser user){
    this._user = user;
  }

  // User data
  int get settingsCount{
    return _settings.length;
  }

  String get getUsername{
    if(_user == null){
      throw Exception('Could not retrieve firebase user');
    }

    return _user.email.split('@')[0];
  }

  String get getUserEmail{
    if(_user == null){
      throw Exception('Could not retrieve firebase user');
    }
    return _user.email;
  }
}
