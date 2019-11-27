import 'package:flutter/material.dart';
import 'package:web_vote_app/common/vote_notifier.dart';
import 'package:web_vote_app/db.dart';
import 'package:web_vote_app/styles/text_styles.dart';

/// Styling for color voting buttons
class VotingButton extends StatelessWidget {
  final VoteNotifier votes;
  final String title;

  VotingButton({this.votes, this.title});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white, width: 4),
      ),
      color: votes.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          Text('${votes.value}', style: buttonTextStyle),
        ],
      ),
      onPressed: () => votes.vote(),
    );
  }
}

