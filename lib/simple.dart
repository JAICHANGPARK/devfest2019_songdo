import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/common.dart';
import 'package:web_app/db.dart';

const buttonTextStyle = TextStyle(
  fontFamily: 'Raleway',
  color: Colors.black,
  fontSize: 64,
);

const labelTextStyle = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w900,
  color: Colors.white,
  fontSize: 32,
);

class SimpleVotingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,),
        Container(
            height: 120,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(child: const Text('Q. Flutter 경험?',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 48
            ),))),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              BlueVotingButton(),
              GreenVotingButton(),
              RedVotingButton(),
              YellowVotingButton(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: CountdownClock(
            styling: labelTextStyle,
          ),
        ),
      ],
    );
  }
}

class VotingLabel extends StatelessWidget {
  const VotingLabel(this.label);
  final String label;

  @override
  Widget build(BuildContext context) => Text(label, style: labelTextStyle);
}

class BlueVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlueVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(votes: notifier,
        title: "경험해봤어요",);
    });
  }
}

class GreenVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GreenVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(votes: notifier,
        title: "실무에 적용중:)",);
    });
  }
}

class RedVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RedVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(votes: notifier,
        title: "비전공자에요",);
    });
  }
}

class YellowVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<YellowVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(votes: notifier,
      title: "아무것도 몰라요",);
    });
  }
}

/// Styling for color voting buttons
class VotingButton extends StatelessWidget {
  VotingButton({this.votes, this.title});
  final VoteNotifier votes;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.white,
          width: 4
        )
      ),
      color: votes.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(
            fontSize: 24,
            color: Colors.black
          ),),
          Text('${votes.value}', style: buttonTextStyle),
        ],
      ),
      onPressed: () => votes.vote(),
    );
  }
}
