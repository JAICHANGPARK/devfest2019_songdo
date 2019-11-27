import 'package:day_night_switch/day_night_switch.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_vote_app/db.dart';
import 'package:web_vote_app/pages/home_page.dart';
import 'package:web_vote_app/pages/votes/second_page.dart';
import 'package:web_vote_app/state_management/theme_changer.dart';
import 'package:web_vote_app/styles/app_string.dart';
import 'package:web_vote_app/styles/app_themes.dart';
import 'package:web_vote_app/ui/app_bar.dart';
import 'package:web_vote_app/ui/common_drawer.dart';
import 'package:web_vote_app/ui/favorite_voting_button.dart';
import 'package:web_vote_app/ui/voting_button.dart';

class VoteTestPage extends StatefulWidget {
  @override
  _VoteTestPageState createState() => _VoteTestPageState();
}

class _VoteTestPageState extends State<VoteTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WebAppBar(),
      drawer: CommonDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              margin: EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, spreadRadius: 2)]),
              child: Center(
                child: Text(
                  "세션 관심도 확인",
                  style: TextStyle(color: Colors.black, fontSize: 34),
                ),
              ),
            ),
            FavoriteVotingButton()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (newValue) {
            switch (newValue) {
              case 0:
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
          ]),
    );
  }
}

class FavoriteVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteNotifier>(builder: (context, notifier, _) {
      return FavVotingButton(
        votes: notifier,
        title: "❤️",
      );
    });
  }
}

//class FavoriteVotingButton extends StatelessWidget {
//  final VoteNotifier votes;
//  FavoriteVotingButton({this.votes});
//
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<FavoriteNotifier>(builder: (context, notifier, _) {
//      return  InkWell(
//        onTap: (){
//          votes.vote();
//        },
//        child: Container(
//          height: MediaQuery.of(context).size.height / 3,
//          width: MediaQuery.of(context).size.width / 2,
//          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 4), color: Colors.white, boxShadow: [
//            BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 5, spreadRadius: 2),
//          ]),
//          child: Center(
//            child: Text(
//              "❤️",
//              style: TextStyle(fontSize: 48),
//            ),
//          ),
//        ),
//      );
//    });
//  }
//}
