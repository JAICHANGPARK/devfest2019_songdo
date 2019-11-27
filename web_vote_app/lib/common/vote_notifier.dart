import 'package:flutter/material.dart';

/// Base class for tracking color votes
abstract class VoteNotifier extends ValueNotifier<int> {
  VoteNotifier(int value, this.castVote) : super(value);
  final Function(String) castVote;
  void vote();
  Color get color;
}