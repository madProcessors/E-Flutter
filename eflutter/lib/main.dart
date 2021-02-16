import 'package:eflutter/chat/chatDashboardPage.dart';
import 'package:eflutter/chat/chatPage.dart';
import 'package:eflutter/login/loginPage.dart';
import 'package:eflutter/models/SettingsData.dart';
import 'package:eflutter/profile/profileSettings/profileSettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile/profilePage.dart';
import 'WelcomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.id,
        routes: {
          WelcomePage.id: (context) => WelcomePage(),
          LoginPage.id: (context) => LoginPage(),
          ProfilePage.id: (context) => ProfilePage(),
          ProfileSettingsPage.id: (context) => ProfileSettingsPage(),
          ChatPage.id: (context) => ChatPage(),
          ChatDashboard.id: (context) => ChatDashboard(),
        },
      ),
    );
  }
}

