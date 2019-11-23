// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:web_app/db.dart';
import 'package:web_app/home_page.dart';
import 'package:web_app/pretty.dart';
import 'package:web_app/simple.dart';

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


class VotingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPretty = Provider.of<ValueNotifier<bool>>(context);
    return MaterialApp(
      title: 'Devfest2019 Songdo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("플러터로 IoT개발 어렵지 않아"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 340,
                decoration: BoxDecoration(color: Colors.red),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_forward),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 600,
                      maxHeight: 800,
                    ),
                    child: InactiveOverlay(
                      child: isPretty.value
                          ? PrettyVotingPage()
                          : SimpleVotingPage(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Container(
                  child: Image.network(
                      "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F76023313%2F322147222069%2F1%2Foriginal.20191008-182146?w=1000&auto=compress&rect=0%2C76%2C1200%2C600&s=4cfb842cd100689e251fb007a8ccab81")),
            ],
          ),
        ),
      ),
    );
  }
}

class InactiveOverlay extends StatelessWidget {
  InactiveOverlay({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer<ActiveNotifier>(builder: (context, notifier, _) {
      return notifier.value
          ? child
          : Stack(
              children: [
                child,
                Container(color: Colors.black45),
                Center(
                  child: Text(
                    'Voting Inactive\n(투표 종료)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
    });
  }
}
