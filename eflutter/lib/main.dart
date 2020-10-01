import 'package:flutter/material.dart';

import './login/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Flutter',
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}