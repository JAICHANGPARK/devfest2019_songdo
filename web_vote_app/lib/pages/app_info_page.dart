import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:web_vote_app/styles/app_string.dart';
import 'dart:html' as html;

class AppInfoPage extends StatefulWidget {
  @override
  _AppInfoPageState createState() => _AppInfoPageState();
}

class _AppInfoPageState extends State<AppInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("정보"),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("개발자 정보 보기"),
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 3,
                backgroundImage: NetworkImage(profileImage),
              ),
              ListTile(
                title: Text(developerTitle),
                subtitle: Text(developerName),
                onTap: () {},
              ),
              ListTile(
                title: Text(githubTitle),
                subtitle: Text(myGithubLink),
                onTap: () {
                  html.window.open(myGithubLink, "");
                },
              ),
              ListTile(
                title: Text(youtubeTitle),
                subtitle: Text(youtubeLink),
                onTap: () {
                  html.window.open(youtubeLink, "");
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text("패키지"),
            children: <Widget>[
              ListTile(
                title: Text("Firebase"),
                onTap: () {
                  html.window.open("https://pub.dev/packages/firebase", "");
                },
              ),
              ListTile(
                title: Text("Provider"),
                onTap: () {
                  html.window.open("https://pub.dev/packages/provider", "");
                },
              ),
            ],
          ),
          ListTile(
            title: Text(codeTitle),
            subtitle: Text("코드 보러가기"),
            onTap: () {
              html.window.open(codeLink, "");
            },
          ),
        ],
      ),
    );
  }
}
