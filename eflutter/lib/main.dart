import 'package:eflutter/models/SettingsData.dart';
import 'package:eflutter/profile/profileSettings/profileSettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile/profilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> SettingsData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColorDark: Colors.black12,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.white54,
          ),
          unselectedWidgetColor: Colors.white54,
        ),
        initialRoute: ProfilePage.id,
        routes: {
          // Login section

          // User profile section
          ProfilePage.id: (context) => ProfilePage(),
          ProfileSettingsPage.id: (context) => ProfileSettingsPage(),
          // Chats section
        },
      ),
    );
  }
}
