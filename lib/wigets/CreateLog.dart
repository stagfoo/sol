import 'package:flutter/material.dart';
import 'package:sol6/utils/database.dart';
import 'package:sol6/utils/icons.dart';

class CreateLog extends StatefulWidget {
  @override
  _CreateLog createState() => new _CreateLog();
}

class _CreateLog extends State<CreateLog> {
  String dayLevel = 'O';
  String logName = '';
  String logTime = new DateTime.now().toUtc().toString().split(" ")[0];

  final db = LogDatabase();
  saveLog(){
    db.addRecord({
      'rating': this.dayLevel,
      'title': this.logName,
      'date': this.logTime,
    });
  }
  updateDayLevel(value) { this.setState(() => dayLevel = value); }
  updateLogName(value) {  this.setState(() => logName = value);  }
  updateLogTime(value) {  this.setState(() => logTime = value);  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(children: <Widget>[
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton ( child: upIcon, onPressed: () => updateDayLevel('U'),),
          FlatButton ( child: okIcon, onPressed: () =>updateDayLevel('O')),
          FlatButton ( child: downIcon, onPressed: () => updateDayLevel('D')),
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
                      style: Theme.of(context).textTheme.body1,
                      onChanged: (value) {
                        updateLogName(value);
                      },
                      onSubmitted: (text) {
                        Navigator.pushNamed(context, '/single');
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
                    Text(logTime)],
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
    ])
    );
  }
}
