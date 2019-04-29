import 'package:flutter/material.dart';
import 'package:sol6/utils/icons.dart';

class LogEntryItem extends StatefulWidget {
  // These Are Widget Props
  LogEntryItem({
    Key key,
    this.title: '',
    this.rating: '',
    this.date: '',
  }) : super(key: key);
  final String title;
  final String rating;
  final String date;

  _LogEntryItem createState() => _LogEntryItem();
}

class _LogEntryItem extends State<LogEntryItem> {
  //This is your Widget State
  bool isPlaying = false;
   final String title = 'Hello';
  final String rating = "U";
  final String date = "1991";


  void _handleTap() {
    setState(() {
      this.isPlaying = !this.isPlaying;
      print('isPlaying');
      print(this.isPlaying);
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:28),
        child: Row(
      children: <Widget>[
        Expanded(
          flex: 4,
        child:
        Column(
          children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.title, style: Theme.of(context).textTheme.caption)
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            height: 1.5,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[getDayLevel(widget.rating), Text(widget.date)],
          )
        ])),
        FlatButton(
          child: (this.isPlaying ? pauseIcon: playIcon),
          onPressed: _handleTap,
        )
      ],
    ));
  }
}
