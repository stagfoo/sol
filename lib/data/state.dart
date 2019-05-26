import 'package:flutter/material.dart';
import 'package:sol6/utils/database.dart';
import 'package:sembast/sembast.dart';

class InheritedState extends InheritedWidget {
  final Map _newRecording = {
    'rating': '',
    'title': '',
    'date': '',
  };  // Data structure is a map because InheritedWidgets are immutable
  final Widget child;
  final db = LogDatabase();
  InheritedState({ this.child }) : super(child: child);

  setNewRecordData(key, val) {
     _newRecording[key] = val;
  }

  singleRecordData(key) async {
    return db.getRecord(key);
  }


  get logs => db.getRecords(10);
  get length => 10;

  // to tell child context has changed, I think
  @override
  bool updateShouldNotify(InheritedState oldWidget) => true;

  static InheritedState of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedState);
}
