import 'package:flutter/material.dart';
import 'package:sol6/wigets/LogEntry.dart';
import 'package:sol6/wigets/CreateLog.dart';
import 'package:sol6/utils/database.dart';


class LogEntry {
  final String title;
  final int rating;
  bool isPlaying;
  final String date;
  LogEntry(this.title, this.rating, this.isPlaying, this.date);
}
class LogListView extends StatefulWidget {
  @override
  _LogListView createState() => new _LogListView();
}



class _LogListView extends State<LogListView> {
  final db = LogDatabase();
  var logs;
  var logsLength;

  getRecords(db) async {
    this.setState(
      logs = await db.getRecords(10)
    );
  }

  @override
  void initState() {
    super.initState();
    this.getRecords(db);
    print(this.logs);
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
                shrinkWrap : true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: LogEntryItem(
                      title: logs[index]['title'],
                      rating: logs[index]['rating'],
                      date: logs[index]['date'],
                    )
                  );
                })
            )
            )
          ],
        ),
      ),
    );
  }
}
