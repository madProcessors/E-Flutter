import 'package:eflutter/chat/chatDashboardPage.dart';
import 'package:eflutter/models/SettingsData.dart';
import 'package:eflutter/utils/Constants.dart';
import 'package:eflutter/utils/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsData>(
        builder: (context, settingsData, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (val) {
                      email = val;
                    },
                    decoration: KTextFieldDecoration("Usuario"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (val) {
                      password = val;
                    },
                    decoration: KTextFieldDecoration("Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.5,
                    color: Colors.grey,
                    title: 'Access',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);

                        if (user != null) {
                          // Save user in global context
                          settingsData.setUser = user.user;
                          Navigator.pushNamedAndRemoveUntil(context, ChatDashboard.id, (route) => false);
                        }

                        setState(() {
                          isLoading = false;
                        });
                      } catch (e) {
                        print('ERROR loginPage' + e);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}
