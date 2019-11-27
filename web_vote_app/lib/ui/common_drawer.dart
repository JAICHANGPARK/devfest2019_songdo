import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_vote_app/pages/votes/first_page.dart';
import 'package:web_vote_app/pages/votes/second_page.dart';
import 'package:web_vote_app/state_management/theme_changer.dart';
import 'package:web_vote_app/styles/app_string.dart';
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
          ExpansionTile(
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
              ),
              ListTile(
                title: Text(question4),
              ),
            ],
            title: Text('Audience 참여 목록'),
          ),
          ExpansionTile(
            leading: Icon(Icons.help_outline),
            children: <Widget>[
              ListTile(
                title: Text(developerTitle),
                subtitle: Text(developerName),
              ),
              ListTile(
                title: Text(githubTitle),
                subtitle: Text(myGithubLink),
              ),
            ],
            title: Text("정보"),
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
