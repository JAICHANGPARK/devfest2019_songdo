import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vote_app/pages/home_page.dart';
import 'package:web_vote_app/ui/app_bar.dart';
import 'package:web_vote_app/ui/common_bnb.dart';
import 'package:web_vote_app/ui/common_drawer.dart';
import 'package:web_vote_app/ui/inactive_view.dart';
import 'package:web_vote_app/ui/pretty.dart';
import 'package:web_vote_app/ui/simple.dart';

class VotingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPretty = Provider.of<ValueNotifier<bool>>(context);
    return Scaffold(
        appBar: WebAppBar(),
        drawer: CommonDrawer(),
        bottomNavigationBar: AppBottomNavigationBar(1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(Icons.home),
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
                      child: isPretty.value ? PrettyVotingPage() : SimpleVotingPage(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                  child: Center(
                child: Image.network(
                    "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F76023313%2F322147222069%2F1%2Foriginal.20191008-182146?w=1000&auto=compress&rect=0%2C76%2C1200%2C600&s=4cfb842cd100689e251fb007a8ccab81"),
              )),
            ],
          ),
        ));
  }
}
