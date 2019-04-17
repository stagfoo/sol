import 'package:flutter/material.dart';

class LogEntryItem extends StatefulWidget {
  // These Are Widget Props
  LogEntryItem({
    Key key,
    this.title: '',
    this.rating: 0,
    this.date: '',
  }) : super(key: key);
  final String title;
  final int rating;
  final String date;

  _LogEntryItem createState() => _LogEntryItem();
}

class _LogEntryItem extends State<LogEntryItem> {
  //This is your Widget State
  bool isPlaying = false;

  // void _handleTapDown(TapDownDetails details) {
  //   setState(() {
  //     isPlaying = true;
  //   });
  // }

  // void _handleTapUp(TapUpDetails details) {
  //   setState(() {
  //     isPlaying = false;
  //   });
  // }

  // void _handleTapCancel() {
  //   setState(() {
  //     isPlaying = false;
  //   });
  // }

  void _handleTap() {
    setState(() {
      this.isPlaying = !this.isPlaying;
      print('isPlaying');
      print(this.isPlaying);
    });
  }

  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          flex: 4,
        child:
        Column(
          children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.title)
          ),
          Container(
            height: 1.5,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text('RATING'), Text(widget.date)],
          )
        ])),
        FlatButton(
          child: Text(this.isPlaying ? 'S': 'P'),
          onPressed: _handleTap,
        )
      ],
    ));
  }
}
