import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget with PreferredSizeWidget{

  @override
  Widget build(BuildContext context) {
     return AppBar(
      title: Text("플러터로 IoT개발, 어렵지 않아"),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

