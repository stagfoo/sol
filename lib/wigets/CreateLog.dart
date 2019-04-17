import 'package:flutter/material.dart';

class CreateLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: TextField(
              style: Theme.of(context).textTheme.body1,
              onSubmitted: (text) {
                Navigator.pushNamed(context, '/single');
              },
            )
          ),
          Container(
            height: 1.5,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('RATING'),
              Text('')],
          )
        ])),
        FlatButton(
          child: Text('R'),
          onPressed: () {
          Navigator.pushNamed(context, '/single');
        },
        )
      ],
    ));
  }
}
