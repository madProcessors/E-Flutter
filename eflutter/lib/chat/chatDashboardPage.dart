import 'package:eflutter/GoodbyePage.dart';
import 'package:eflutter/models/SettingsData.dart';
import 'package:eflutter/profile/profilePage.dart';
import 'package:eflutter/utils/Constants.dart';
import 'package:eflutter/utils/components/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/components/NavButton.dart';

class ChatDashboard extends StatefulWidget {
  static String id = 'ChatDashboard';

  @override
  _ChatDashboardState createState() => _ChatDashboardState();
}

class _ChatDashboardState extends State<ChatDashboard> with SingleTickerProviderStateMixin {
  int selectedBtn = 0;
  TabController _tabController;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsData>(builder: (context, settingsData, child) {
      return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SafeArea(
              child: Container(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 19,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        settingsData.getUsername,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Spacer(),
                    SearchBar(
                      hintText: 'Msg by regex...',
                      controller: searchBarController,
                      onXPressed: () {
                        FocusScope.of(context).unfocus();
                        searchBarController.clear();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 4), // changes position of shadow
                  )
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Color(0xffffa255),
              ),
              height: 50,
              child: ButtonBar(
                buttonTextTheme: ButtonTextTheme.accent,
                mainAxisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.center,
                children: [
                  NavButton(
                    title: 'Chats',
                    selected: selectedBtn == 0 ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedBtn = 0;
                      });
                      _tabController.animateTo(selectedBtn);
                    },
                  ),
                  NavButton(
                    title: 'Config',
                    selected: selectedBtn == 1 ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedBtn = 1;
                      });
                      _tabController.animateTo(selectedBtn);
                    },
                  ),
                  NavButton(
                    title: 'Logout',
                    selected: selectedBtn == 2 ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedBtn = 2;
                      });
                      _tabController.animateTo(selectedBtn);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [Text('ITEM 1'), ProfilePage(), GoodbyePage()],
              ),
            )
          ],
        ),
      );
    });
  }
}
