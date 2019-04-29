import 'package:flutter/material.dart';
import 'package:sol6/wigets/LogEntry.dart';
import 'package:sol6/wigets/CreateLog.dart';
import 'package:sol6/utils/database.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LogEntry {
  final String title;
  final String rating;
  bool isPlaying;
  final String date;
  LogEntry(this.title, this.rating, this.isPlaying, this.date);
}
class LogListView extends StatefulWidget {
  final Future<List<Record>> logs;
  final db = LogDatabase();
  LogListView({Key key, this.logs}) : super(key: key);
  @override
  _LogListView createState() => new _LogListView();
}


class _LogListView extends State<LogListView> {
  List<Record> _logs = [];

  void loadRecords() async {
    final temp = await widget.db.getRecords(10);
    this.setState((){
      _logs = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadRecords();
  }
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/blur-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsetsDirectional.only(top: 68),
              child: Text("How was your day?", style: Theme.of(context).textTheme.display1)
            ),
            CreateLog(),
            Expanded(
              flex: 1,
              child: Container(
              padding:EdgeInsets.all(20),
              child:ListView.builder(
                itemCount: 10,
                shrinkWrap : true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if(index < _logs.length) {
                  return GestureDetector(
                    child: LogEntryItem(
                      title: _logs[index]['title'],
                      rating: _logs[index]['rating'],
                      date: _logs[index]['date'],
                    )
                  );
                }}
              )
            )
            )
          ],
        ),
      ),
    );
  }
}
