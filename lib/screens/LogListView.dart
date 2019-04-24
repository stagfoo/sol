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

class LogListView extends StatelessWidget {
  final logs = List<LogEntry>.generate(
    20  ,
    (i) => LogEntry(
        'LogEntry $i',
        0,
        true,
        '$i/10/1991'),
  );

  @override
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
              padding: EdgeInsets.all(32.0),
              child: Text("How was your day?", style: Theme.of(context).textTheme.display1)
            ),
            CreateLog(),
            Expanded( child: ListView.builder(
                itemCount: logs.length,
                shrinkWrap : true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: LogEntryItem(
                      title: logs[index].title,
                      rating: logs[index].rating,
                      date: logs[index].date,

                    )
                  );
                })
            )
          ],
        ),
      ),
    );
  }
}
