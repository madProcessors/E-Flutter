import 'file:///C:/Users/itsme007/Documents/madProcessors/flutterProjects/E-Flutter/eflutter/lib/profile/profileSettings/profileSettingsPage.dart';
import 'package:eflutter/models/SettingsData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static String id = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsData>(
      builder: (context, settingsData, child) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/img/orange_wallpaper.jpg')),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hi, ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      settingsData.getUsername,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                        ),
                      ),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/5/5f/Blue_Box_in_museum.jpg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(settingsData.getUserEmail),
                ),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton.icon(
                        color: Colors.black,
                        textColor: Colors.white,
                        splashColor: Colors.blueGrey,
                        label: Text('Set Status'),
                        onPressed: () => print('hola'),
                        icon: Icon(Icons.edit, size: 20),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ProfileSettingsPage();
                      },
                    );
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
