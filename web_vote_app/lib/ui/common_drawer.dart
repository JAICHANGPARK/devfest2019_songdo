import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_vote_app/state_management/theme_changer.dart';
import 'package:web_vote_app/styles/app_themes.dart';

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
                        "https://pds.joins.com/news/component/htmlphoto_mmdata/201910/26/ce877ed2-0800-457f-b9a6-a86044718d40.jpg",
                      ),
                      fit: BoxFit.cover)),
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
          ExpansionTile(
            children: <Widget>[
              ListTile(
                title: Text("질문 1"),
              ),
              ListTile(
                title: Text("질문 2"),
              ),
              ListTile(
                title: Text("질문 3"),
              ),
              ListTile(
                title: Text("질문 4"),
              ),
            ],
            title: Text('Audience 참여 목록'),
          ),
          ExpansionTile(
            leading: Icon(Icons.help_outline),
            children: <Widget>[
              ListTile(
                title: Text("개발자"),
                subtitle: Text("Dreamwalker"),
              ),
              ListTile(
                title: Text("Github"),
                subtitle: Text("https://github.com/JAICHANGPARK"),
              ),

            ], title: Text("정보"),
          )
        ],
      ),
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
