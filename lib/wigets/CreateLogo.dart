import 'package:flutter/material.dart';

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
