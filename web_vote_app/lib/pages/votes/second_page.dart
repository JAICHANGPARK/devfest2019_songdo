import 'package:flutter/material.dart';
import 'package:web_vote_app/pages/home_page.dart';
import 'package:web_vote_app/styles/app_string.dart';
import 'package:web_vote_app/ui/app_bar.dart';
import 'package:web_vote_app/ui/common_bnb.dart';
import 'package:web_vote_app/ui/common_drawer.dart';
import 'package:web_vote_app/ui/common_fb.dart';
import 'package:web_vote_app/ui/inactive_view.dart';
import 'package:web_vote_app/ui/pretty.dart';

class VotingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WebAppBar(),
        drawer: CommonDrawer(),
        bottomNavigationBar: AppBottomNavigationBar(1),
        floatingActionButton: AppFloatingActionButton(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 600,
                      maxHeight: 800,
                    ),
                    child: InactiveOverlay(
                      child: PrettyVotingPage(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                  child: Center(
                child: Image.network(devfestImage),
              )),
            ],
          ),
        ));
  }
}
