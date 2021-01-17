import 'package:eflutter/models/SettingsData.dart';
import 'package:eflutter/profile/profileSettings/widgets/settingCheckTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsCheckList extends StatefulWidget {
  @override
  _SettingsCheckListState createState() => _SettingsCheckListState();
}

class _SettingsCheckListState extends State<SettingsCheckList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsData>(
      builder: (context, settingsData, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final setting = settingsData.settings[index];

            return SettingCheckTile(
              isChecked: setting.value == '1' ? true : false,
              settingDescription: setting.description,
              checkCallback: (checkState){
                settingsData.updateSetting(setting);
              }
            );
          },
          itemCount: settingsData.settingsCount,
        );
      },
    );
  }
}
