import 'package:flutter/material.dart';

import './profile/profilePage.dart';
import './models/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var user = User();

  @override
  Widget build(BuildContext context) {
    user.username = 'BRYAN';
    user.email = 'BRYAN@asd.com';
    return MaterialApp(
      home: Scaffold(
        body: ProfilePage(user),
      ),
    );
  }
}
