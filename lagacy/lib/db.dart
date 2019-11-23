import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

final colorMap = {
  'blue': Colors.blue,
  'green': Colors.green,
  'yellow': Colors.yellow,
  'red': Colors.red
};

/// Tracks if voting is active/enabled
class ActiveNotifier extends ValueNotifier<bool> {
  ActiveNotifier([bool value = false]) : super(value);
}

/// Tracks current countdown value
class CountdownNotifier extends ValueNotifier<int> {
  CountdownNotifier([int value = 0]) : super(value);
}

/// Base class for tracking color votes
abstract class VoteNotifier extends ValueNotifier<int> {
  VoteNotifier(int value, this.castVote) : super(value);
  final Function(String) castVote;

  void vote();

  Color get color;
}

class GreenVoteNotifier extends VoteNotifier {
  GreenVoteNotifier(int value, Function(String) castVote)
      : super(value, castVote);

  @override
  void vote() => castVote('green');

  @override
  Color get color => Colors.green;
}

class BlueVoteNotifier extends VoteNotifier {
  BlueVoteNotifier(int value, Function(String) castVote)
      : super(value, castVote);

  @override
  void vote() => castVote('blue');

  @override
  Color get color => Colors.blue;
}

class RedVoteNotifier extends VoteNotifier {
  RedVoteNotifier(int value, Function(String) castVote)
      : super(value, castVote);

  @override
  void vote() => castVote('red');

  @override
  Color get color => Colors.red;
}

class YellowVoteNotifier extends VoteNotifier {
  YellowVoteNotifier(int value, Function(String) castVote)
      : super(value, castVote);

  @override
  void vote() => castVote('yellow');

  @override
  Color get color => Colors.yellow[700];
}

/// Manages the Firestore data streams
class FirebaseInstance {
  FirebaseInstance() {
    _initializeFirebase();
    blueNotifier = BlueVoteNotifier(0, castVote);
    greenNotifier = GreenVoteNotifier(0, castVote);
    redNotifier = RedVoteNotifier(0, castVote);
    yellowNotifier = YellowVoteNotifier(0, castVote);
  }

  fb.App app;
  fs.Firestore store;

  final pretty = ValueNotifier<bool>(false);
  final activeNotifier = ActiveNotifier();
  final countdownNotifier = CountdownNotifier();

  // Initialized in constructor
  BlueVoteNotifier blueNotifier;
  GreenVoteNotifier greenNotifier;
  RedVoteNotifier redNotifier;
  YellowVoteNotifier yellowNotifier;

  void _initializeFirebase() {
    // Hack to ensure two apps are not created at the same time
    final appName = DateTime.now().toString();
    app = fb.initializeApp(
      name: appName,
      apiKey: "AIzaSyCfebT7Qa-7kAX_PrTdBJ1SwnJJJoS71C4",
      authDomain: "fir-study-f0a3e.firebaseapp.com",
      databaseURL: "https://fir-study-f0a3e.firebaseio.com",
      projectId: "fir-study-f0a3e",
      storageBucket: "fir-study-f0a3e.appspot.com",
      messagingSenderId: "244849017279",
//        appId: "1:244849017279:web:7c6d40d787a1a387a9a10a",
//        measurementId: "G-XHCHVZG0W2"
      // appId: '1:150136682850:web:d14f3a68ab2b79f0',
    );

    store = fb.firestore(app);

    // Set up settings listener
    final settingsCollection = store.collection('settings');
    settingsCollection.onSnapshot.listen((querySnapshot) {
      querySnapshot.docChanges().forEach((change) {
        if (['added', 'modified'].contains(change.type))
          _settingsChanged(change);
      });
    });

    // Set up colour changes
    final ref = store.collection('votes');
    ref.onSnapshot.listen((querySnapshot) {
      querySnapshot.docChanges().forEach((change) {
        if (['added', 'modified'].contains(change.type)) _colourVote(change);
      });
    });
  }

  ValueNotifier<int> colourNotifier(String colour) {
    switch (colour) {
      case 'yellow':
        return yellowNotifier;
      case 'green':
        return greenNotifier;
      case 'blue':
        return blueNotifier;
      default:
        return redNotifier;
    }
  }

  void castVote(String colour) {
    final ref = store.doc('votes/$colour');
    ref.get().then((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        final count = data['votes'] as num;
        ref.set({'votes': count + 1});
      } else {
        print('Color doesnt exist');
      }
    });
  }

  _settingsChanged(fs.DocumentChange change) {
    if (change.doc.id == 'web_app_settings') {
      if (change.doc.data().containsKey('purdy')) {
        print('Unpdating purdy: ${change.doc.data()['purdy']}');
        pretty.value = change.doc.data()['purdy'];
      }
      if (change.doc.data().containsKey('countdown') && !activeNotifier.value) {
        final now = DateTime.now();
        final start = change.doc.data()['countdown'];
        activeNotifier.value = now.isBefore(start);
        _startCountdown(start.difference(now));
      }
    }
  }

  void _startCountdown(Duration duration) async {
    const frequency = Duration(seconds: 1);
    var remaining = duration;
    while (remaining >= const Duration()) {
      countdownNotifier.value = remaining.inSeconds;
      remaining -= frequency;
      await Future.delayed(frequency);
    }
    // Disable voting when timer has completed
    activeNotifier.value = false;
  }

  void _colourVote(fs.DocumentChange change) {
    final data = change.doc.data();
    final color = change.doc.id;
    final votes = data['votes'] as num;
    colourNotifier(color).value = votes;
  }
}
