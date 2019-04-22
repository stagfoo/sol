// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'screens/LogListView.dart';
import 'screens/RecordingView.dart';
import 'screens/SplashView.dart';

var state = {
  'currentName': '',
  'file': '',
  'list': {}
};

void main() {
  runApp(MaterialApp(
    title: 'SOL', // used by the OS task switcher
    theme: new ThemeData(
      primarySwatch: Colors.red,
      textTheme: TextTheme(
        headline: TextStyle(
            fontSize: 72.0, fontWeight: FontWeight.w100, color: Colors.white,  fontFamily: 'Montserrat'),
        title: TextStyle(
            fontSize: 36.0, color: Colors.white, fontFamily: 'Cormorant', fontWeight: FontWeight.normal),
        display1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w200, color: Colors.white, fontFamily: 'Montserrat'),
        body1: TextStyle( fontSize: 16.0, color: Colors.white, fontFamily: 'Cormorant', fontWeight: FontWeight.normal),
        body2: TextStyle( fontSize: 16.0, color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.normal),
      ),
    ),
    home: SplashView(),
    routes: <String, WidgetBuilder>{
      '/list': (BuildContext context) => LogListView(),
      '/single': (BuildContext context) => RecordingView()
    },
  ));
}
