// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:objectdb_flutter/objectdb_flutter.dart';
import 'wigets/logEnrtry.dart';
import 'package:path_provider/path_provider.dart' as path;

class ListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
     child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/blur-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SOL"),
            Text("Alone, Together"),
          ],
        ),
      ),
    );
  }
}




class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
     child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/main-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SOL"),
            Text("Alone, Together"),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: SplashView(),
  ));
}
