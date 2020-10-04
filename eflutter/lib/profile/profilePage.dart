import 'package:flutter/material.dart';
import '../reports/reportsPage.dart';

class ProfilePage extends StatelessWidget {
  var user;

  ProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Profile'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/img/orange_wallpaper.jpg')),
        ),
        child: Material(
          color: Colors.transparent,
          elevation: 8,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    Text('Hi, '),
                    Text(
                      '${user.username}!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        color: Colors.white,
                        textColor: Colors.black,
                        splashColor: Colors.blueGrey,
                        label: Text('Publish'),
                        onPressed: () => print('hola'),
                        icon: Icon(Icons.add_circle, size: 20),
                      ),
                      FlatButton.icon(
                        color: Colors.black,
                        textColor: Colors.white,
                        splashColor: Colors.blueGrey,
                        label: Text('Edit publications'),
                        onPressed: () => print('hola'),
                        icon: Icon(Icons.edit, size: 20),
                      ),
                      FlatButton.icon(
                        color: Colors.black,
                        textColor: Colors.white,
                        splashColor: Colors.blueGrey,
                        label: Text('Watch reports'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReportsPage(),
                          ),
                        ),
                        icon: Icon(Icons.receipt, size: 20),
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 300,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () => print('SETTINGS'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
