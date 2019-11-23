import 'package:day_night_switch/day_night_switch.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_vote_app/pages/votes/second_page.dart';
import 'package:web_vote_app/state_management/theme_changer.dart';
import 'package:web_vote_app/styles/app_themes.dart';
import 'package:web_vote_app/ui/app_bar.dart';
import 'package:web_vote_app/ui/common_drawer.dart';

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context){
              return VotingApp();
            }
          ));
        },

      ),
    );
  }
}
