import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 100.0, maxWidth: 70.0),
            child: Container(
              width: 200.0,
              color: Colors.lightBlue,
              child: Icon(Icons.pool),
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.pool),
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
