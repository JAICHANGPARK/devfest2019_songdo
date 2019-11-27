import 'package:flutter/material.dart';
import 'package:web_vote_app/common/vote_notifier.dart';
import 'package:web_vote_app/db.dart';
import 'package:web_vote_app/styles/text_styles.dart';
/// Styling for color voting buttons
class FavVotingButton extends StatelessWidget {
  final VoteNotifier votes;
  final String title;

  FavVotingButton({this.votes, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        votes.vote();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 4), color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 5, spreadRadius: 2),
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "❤️",
              style: TextStyle(fontSize: 48),
            ),
            Text('${votes.value}', style: buttonTextStyle),
          ],
        ),
      ),
    );
  }
}
