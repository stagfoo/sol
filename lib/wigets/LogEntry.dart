import 'package:flutter/material.dart';

class LogEntryItem extends StatefulWidget {
  // These Are Widget Props
  LogEntryItem({
    Key key,
    this.title: '',
    this.rating: 0,
    this.date: '',
  }) : super(key: key);
  String title;
  int rating;
  String date;

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
      child: Column(
        children: <Widget>[
          Text(widget.title,
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
          Text(widget.rating.toString(),
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
          Text(widget.date,
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
          FlatButton(
            child: Text('P'),
            onPressed: _handleTap,
          )
        ],
      ),
    );
  }
}
