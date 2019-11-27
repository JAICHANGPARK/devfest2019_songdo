import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vote_app/pages/home_page.dart';
import 'package:web_vote_app/styles/app_string.dart';
import 'package:web_vote_app/ui/app_bar.dart';
import 'package:web_vote_app/ui/common_bnb.dart';
import 'package:web_vote_app/ui/common_drawer.dart';
import 'package:web_vote_app/ui/inactive_view.dart';
import 'package:web_vote_app/ui/pretty.dart';
import 'package:web_vote_app/ui/simple.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    final isPretty = Provider.of<ValueNotifier<bool>>(context);
    return Scaffold(
        appBar: WebAppBar(),
        drawer: CommonDrawer(),
        bottomNavigationBar: AppBottomNavigationBar(2),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
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
                child: Image.network(devfestImage),
              )),
            ],
          ),
        ));
  }
}
