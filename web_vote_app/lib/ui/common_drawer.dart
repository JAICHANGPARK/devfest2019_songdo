import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_vote_app/pages/app_info_page.dart';
import 'package:web_vote_app/pages/votes/first_page.dart';
import 'package:web_vote_app/pages/votes/last_page.dart';
import 'package:web_vote_app/pages/votes/second_page.dart';
import 'package:web_vote_app/pages/votes/third_page.dart';
import 'package:web_vote_app/state_management/theme_changer.dart';
import 'package:web_vote_app/styles/app_string.dart';
import 'package:web_vote_app/styles/app_themes.dart';

import 'dart:html' as html;

class CommonDrawer extends StatefulWidget {
  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  var _darkTheme = true;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        pangsuImage,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "여기는 팽수 있음",
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Divider(),
          SwitchListTile(
            title: Text("Dark Mode"),
            onChanged: (val) {
              setState(() {
                _darkTheme = val;
              });
              onThemeChanged(val, themeNotifier);
            },
            value: _darkTheme,
          ),
          ListTile(
            leading: Icon(Icons.insert_drive_file),
            onTap: () {
              html.window.open(balpyho, "");
            },
            title: Text("발표자료 보기"),
          ),
          ExpansionTile(
            leading: Icon(Icons.apps),
            children: <Widget>[
              ListTile(
                title: Text(question1),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => VoteTestPage()));
                },
              ),
              ListTile(
                title: Text(question2),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => VotingApp()));
                },
              ),
              ListTile(
                title: Text(question3),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThirdPage()));
                },
              ),
              ListTile(
                title: Text(question4),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LastPage()));
                },
              ),
            ],
            title: Text('Audience 참여 목록'),
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("정보"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppInfoPage()));
            },
          )
        ],
      ),
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value) ? themeNotifier.setTheme(darkTheme) : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
