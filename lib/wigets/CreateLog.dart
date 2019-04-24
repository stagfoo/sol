import 'package:flutter/material.dart';
import 'package:sol6/utils/database.dart';

class CreateLog extends StatefulWidget {
  @override
  _CreateLog createState() => new _CreateLog();
}

class _CreateLog extends State<CreateLog> {
  String dayLevel = 'O';
  String logName = '';
  String logTime = '';

  final db = LogDatabase();
  saveLog(log){
    db.addRecord(log);
  }
  updateDayLevel(value) async {
    this.dayLevel = value;
    print(this.dayLevel);
    var record = db.addRecord({
      'dayLevel': this.dayLevel
    });
    print(await record);
    print(await db.getRecords(10));
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton ( child: Text('U'), onPressed: () => updateDayLevel('U'),),
          FlatButton ( child: Text('O'), onPressed: () =>updateDayLevel('O')),
          FlatButton ( child: Text('B'), onPressed: () => updateDayLevel('B')),
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
                      onSubmitted: (text) {
                        Navigator.pushNamed(context, '/single');
                      },
                    )),
                Container(
                  height: 1.5,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('RATING'), Text('')],
                )
              ])),
          FlatButton(
            child: Text('R'),
            onPressed: () {
              Navigator.pushNamed(context, '/single');
            },
          )
        ],
      ))
    ]);
  }
}
