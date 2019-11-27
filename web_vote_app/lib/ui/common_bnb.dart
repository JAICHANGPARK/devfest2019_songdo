import 'package:flutter/material.dart';
import 'package:web_vote_app/pages/votes/first_page.dart';
import 'package:web_vote_app/pages/votes/second_page.dart';
import 'package:web_vote_app/styles/app_string.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  AppBottomNavigationBar(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (newValue) {
          switch (newValue) {
            case 0:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VoteTestPage()));
              break;
            case 1:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VotingApp()));
              break;
            default:
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text(question1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text(question2),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), title: Text(question3)),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), title: Text(question4)),
        ]);
  }
}
