import 'package:flutter/material.dart';
import 'package:sol6/utils/database.dart';
import 'package:sol6/utils/icons.dart';
import 'package:sol6/screens/RecordingView.dart';

class CreateLog extends StatefulWidget {
  @override
  _CreateLog createState() => new _CreateLog();
}

final TextEditingController _nameField = new TextEditingController();

class _CreateLog extends State<CreateLog> {
  String dayLevel = 'O';
  String logName = '';
  String logTime = new DateTime.now().toUtc().toString().split(" ")[0];
  var record;

  final db = LogDatabase();
  saveLog() {
    this.record = db.addRecord({
      'rating': this.dayLevel,
      'title': this.logName,
      'date': this.logTime,
    });
    this.dayLevel = '';
    this.logName = '';
    this.logTime = '';
    _nameField.clear();
  }

  updateDayLevel(value) {
    this.setState(() => dayLevel = value);
  }

  updateLogName(value) {
    this.setState(() => logName = value);
  }

  updateLogTime(value) {
    this.setState(() => logTime = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: upIcon,
                onPressed: () => updateDayLevel('U'),
              ),
              FlatButton(child: okIcon, onPressed: () => updateDayLevel('O')),
              FlatButton(child: downIcon, onPressed: () => updateDayLevel('D')),
            ],
          ),
          Container(
              child: Row(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Column(children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: _nameField,
                          style: Theme.of(context).textTheme.body1,
                          onChanged: (value) {
                            updateLogName(value);
                          },
                          onSubmitted: (text) {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new RecordingView(
                                            {record: this.record}
                                  )
                            ));
                          },
                        )),
                    Container(
                      height: 1.5,
                      color: Colors.white,
                    ),
                    Container(
                        padding: EdgeInsetsDirectional.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            getDayLevel(this.dayLevel),
                            Text(logTime)
                          ],
                        ))
                  ])),
              FlatButton(
                child: recordIcon,
                onPressed: () {
                  saveLog();
                  print({
                    'rating': this.dayLevel,
                    'title': this.logName,
                    'date': this.logTime,
                  });
                  Navigator.pushNamed(context, '/single');
                },
              )
            ],
          ))
        ]));
  }
}
