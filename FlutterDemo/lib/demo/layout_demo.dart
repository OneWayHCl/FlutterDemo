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
          SizedBox(
              width: 300.0,
              height: 200.0,
              child: Container(
                alignment: Alignment(0.6, -0.8),
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 50.0,
                ),
              )),
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
          // Positioned(right: 20.0, bottom: 20.0, child: Icon(Icons.pool)) //Stack里面使用
        ],
      ),
    );
  }
}
