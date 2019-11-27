import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vote_app/db.dart';
import 'package:web_vote_app/pages/home_page.dart';
import 'package:web_vote_app/state_management/theme_changer.dart';
import 'package:web_vote_app/styles/app_themes.dart';

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
        ChangeNotifierProvider.value(
          value: firebase.favoriteNotifier,
        ),
        ChangeNotifierProvider<ThemeNotifier>(
          builder: (_) => ThemeNotifier(lightTheme),
        ),
      ],
      child:AppMain()
    ),
  );
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return  MaterialApp(
      theme: themeNotifier.getTheme(),
      title: 'Devfest2019 Songdo',
      home: HomePage(),
    );
  }
}



