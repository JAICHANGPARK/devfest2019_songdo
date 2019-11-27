import 'package:flutter/material.dart';
import 'package:web_vote_app/styles/text_styles.dart';

class VotingLabel extends StatelessWidget {
  const VotingLabel(this.label);
  final String label;
  @override
  Widget build(BuildContext context) => Text(label, style: labelTextStyle);
}