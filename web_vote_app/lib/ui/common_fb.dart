import 'package:flutter/material.dart';
import 'package:web_vote_app/pages/home_page.dart';

class AppFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.home),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      },
    );
  }
}
