import 'dart:async';

import 'package:eflutter/login/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoodbyePage extends StatefulWidget {
  @override
  _GoodbyePageState createState() => _GoodbyePageState();
}

class _GoodbyePageState extends State<GoodbyePage> {
  Timer _timer;
  int _start = 11;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void go() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });

        _auth.signOut();
        Navigator.pushNamedAndRemoveUntil(context, LoginPage.id,((Route<dynamic> route)=> false));
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    go();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          _start - 1 > 0 ? (_start -1).toString() : 'BOOOOM',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
