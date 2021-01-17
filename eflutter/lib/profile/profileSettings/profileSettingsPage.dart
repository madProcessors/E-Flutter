import 'package:eflutter/profile/profileSettings/widgets/settingCheckList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatelessWidget {
  static String id = 'ProfileConfigPage';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(
          color: Color(0xfff4f4f4),
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Text(
            'SETTINGS',
            style: TextStyle(color: Colors.white54, fontSize: 20),
          ),
          SettingsCheckList(),
        ],
      ),
    );
  }
}
