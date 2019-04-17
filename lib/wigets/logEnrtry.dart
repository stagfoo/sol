import 'package:flutter/material.dart';

class LogEntry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EntryLogState();
  }
}

class _EntryLogState extends State<LogEntry> {
  String _name = "";
  String _date = "";
  String _fileName = "";
  bool _isPlaying = false;
  String get name => _name;
  String get date => _date;
  String get fileName => _fileName;
  bool get isPlaying => _isPlaying;

  set name(String name) {
        _name = name;
  }
  set date(String date) {
        _date = date;
  }
  set file(String file) {
        _fileName = file;
  }

  @override

  Widget build(BuildContext context) {
    return Card(child: Padding(padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[TextField(
        onSubmitted: (String userInput){
          setState(() {
            _name = userInput;
          });
        },
      ),

      ],
      )

      )
    );
  }
}


