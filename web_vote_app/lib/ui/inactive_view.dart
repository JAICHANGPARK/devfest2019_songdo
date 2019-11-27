import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vote_app/db.dart';

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
