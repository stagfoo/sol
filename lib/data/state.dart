import 'package:flutter/material.dart';
import 'package:sol6/utils/database.dart';
import 'package:sembast/sembast.dart';

class InheritedState extends InheritedWidget {
  final Map _newRecording = {
    'rating': '',
    'title': '',
    'date': '',
  };  // Data structure is a map because InheritedWidgets are immutable
  final _logList = LogDatabase().getRecords(10);
  final Widget child;

  InheritedState({ this.child }) : super(child: child);

  setNewRecordData(key, val) {
     _newRecording[key] = val;
  }

  get singleRecordData(key) async {
    return LogDatabase().getRecord(key);
  }

  get logs => _logList;

  // to tell child context has changed, I think
  @override
  bool updateShouldNotify(InheritedState oldWidget) => true;

  static InheritedState of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedState);
}
