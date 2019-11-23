import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vote_app/db.dart';
import 'package:web_vote_app/pages/home_page.dart';

void main() {
  final firebase = FirebaseInstance();
  runApp(
    MultiProvider(
      providers: [
        // pretty/ugly ui
        ChangeNotifierProvider<ValueNotifier<bool>>.value(
            value: firebase.pretty),
        // active/inactive voting
        ChangeNotifierProvider.value(
          value: firebase.activeNotifier,
        ),
        // Countdown stream
        ChangeNotifierProvider.value(
          value: firebase.countdownNotifier,
        ),
        // blue votes
        ChangeNotifierProvider.value(
          value: firebase.blueNotifier,
        ),
        // green votes
        ChangeNotifierProvider.value(
          value: firebase.greenNotifier,
        ),
        // red votes
        ChangeNotifierProvider.value(
          value: firebase.redNotifier,
        ),
        // yellow votes
        ChangeNotifierProvider.value(
          value: firebase.yellowNotifier,
        ),
      ],
      child: MaterialApp(
        title: 'Devfest2019 Songdo',
        home: HomePage(),
      ),
    ),
  );
}


