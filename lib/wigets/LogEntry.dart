import 'package:flutter/material.dart';

class LogEntryItem extends StatefulWidget {
  // These Are Widget Props
  LogEntryItem({
    Key key,
    this.active: false,
    this.highlight: false,

  }): super(key: key);
  bool active;
  bool highlight;


  _LogEntryItem createState() => _LogEntryItem();
}

class _LogEntryItem extends State<LogEntryItem> {
  //This is your Widget State
  bool highlight = false;
  bool active = false;


  void _handleTapDown(TapDownDetails details) {
    setState(() {
      highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      highlight = false;
    });
  }

  void _handleTap() {
    setState(() {
      widget.active = !widget.active;
    });
  }

  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return GestureDetector(
      onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color:
              widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: highlight
              ? Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
