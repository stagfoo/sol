import 'package:flutter/material.dart';
import 'package:sol6/wigets/LogEntry.dart';


class LogEntry {
  final String title;
  final String description;
  bool isPlaying;
  final String date;
  LogEntry(this.title, this.description, this.isPlaying, this.date);
}

class CreateLog extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

        Expanded(
          flex: 4,
          child: Column(
            children: <Widget>[
              TextField(
                style: Theme.of(context).textTheme.body1,
              ),
              Container(
              padding: EdgeInsets.all(16.0),
              child:Text('19/10/19', style: Theme.of(context).textTheme.body2)),
            ],
          )
        ),

        Expanded(
          flex: 1,
          child: FlatButton(
          child: Text('R'),
          onPressed: () {
            Navigator.pushNamed(context, '/single');
          }
        ,)

        ),

      ],)
    );
  }
}


class LogListView extends StatelessWidget {

  final logs = List<LogEntry>.generate(
    20  ,
    (i) => LogEntry(
        'LogEntry $i',
        'A description of what needs to be done for Todo $i',
        true,
        '19/10/1991'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('UP'),
                Text('OK'),
                Text('BAD'),
              ],
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
                      active: logs[index].isPlaying,
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
