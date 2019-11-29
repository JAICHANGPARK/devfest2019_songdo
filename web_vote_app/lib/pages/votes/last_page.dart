import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vote_app/db.dart';
import 'package:web_vote_app/pages/home_page.dart';
import 'package:web_vote_app/ui/app_bar.dart';
import 'package:web_vote_app/ui/common_bnb.dart';
import 'package:web_vote_app/ui/common_drawer.dart';
import 'package:web_vote_app/ui/common_fb.dart';
import 'package:web_vote_app/ui/like_voting_button.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WebAppBar(),
      drawer: CommonDrawer(),
      bottomNavigationBar: AppBottomNavigationBar(3),
      floatingActionButton: AppFloatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, spreadRadius: 2)]),
              child: Center(
                child: Text(
                  "세션 만족도🍰",
                  style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            FavoriteVotingButton()
          ],
        ),
      ),
    );
  }
}

class FavoriteVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Q3LikeNotifier>(builder: (context, notifier, _) {
      return LikeVotingButton(
        votes: notifier,
        title: "👍",
      );
    });
  }
}
