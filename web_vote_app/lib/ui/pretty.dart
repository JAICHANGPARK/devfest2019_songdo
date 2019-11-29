import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:web_vote_app/common/vote_notifier.dart';
import 'package:web_vote_app/db.dart';
import 'package:web_vote_app/styles/text_styles.dart';
import 'package:web_vote_app/ui/common.dart';
import 'package:web_vote_app/ui/voting_button.dart';

class PrettyVotingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 7,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
                child: const Text(
              'Q. 🙋‍♀️ 🙋‍♂️저는 ⭕️⭕️ 입니다',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
            ))),

        Padding(
          padding: const EdgeInsets.all(10),
          child: CountdownClock(
            styling: labelTextStyle,
          ),
        ),
        SizedBox(height: 16,),
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
    return Consumer<Q2OneNotifier>(builder: (context, notifier, _) {
      return VotingButton(
        votes: notifier,
        title: "👩‍🎨디자이너👨‍🎨",
      );
    });
  }
}

class GreenVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Q2TwoNotifier>(builder: (context, notifier, _) {
      return VotingButton(
        votes: notifier,
        title: "👨‍💻개발자/엔지니어👩‍💻",
      );
    });
  }
}

class RedVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Q2ThreeNotifier>(builder: (context, notifier, _) {
      return VotingButton(
        votes: notifier,
        title: "👩‍🎓학생/대학(원)생👨‍🎓",
      );
    });
  }
}

class YellowVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Q2FourNotifier>(builder: (context, notifier, _) {
      return VotingButton(
        votes: notifier,
        title: "🧟‍♂️아무생각없음🧟‍♀️",
      );
    });
  }
}

class ScalingText extends StatefulWidget {
  ScalingText(this.text);

  final String text;

  @override
  _ScalingTextState createState() => _ScalingTextState();
}

class _ScalingTextState extends State<ScalingText> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 1.0).animate(curve);
    controller.forward();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Text(
        widget.text,
        style: buttonTextStyle,
      ),
    );
  }
}
