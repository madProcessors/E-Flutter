import 'package:flutter/material.dart';

class SettingCheckTile extends StatelessWidget {
  final bool isChecked;
  final String settingDescription;
  final Function checkCallback;

  const SettingCheckTile({this.isChecked, this.settingDescription, this.checkCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        settingDescription,
        style: TextStyle(color: Colors.white54),
      ),
      trailing: Checkbox(
        activeColor: Colors.orange,
        focusColor: Colors.white54,
        value: isChecked,
        onChanged: checkCallback,
      ),
    );
  }
}
