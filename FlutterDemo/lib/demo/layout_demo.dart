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
          StackLayoutDemo()
          // Positioned(right: 20.0, bottom: 20.0, child: Icon(Icons.pool)) //Stack里面使用
        ],
      ),
    );
  }
}

class StackLayoutDemo extends StatelessWidget {
  const StackLayoutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SizedBox(
              width: 350.0,
              height: 220.0,
              child: Container(
                alignment: Alignment(-1, 1),
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
            constraints: BoxConstraints(minHeight: 100.0, maxWidth: 150.0),
            child: Container(
              width: 300.0,
              color: Colors.yellow,
              child: Icon(Icons.pool),
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            color: Colors.red,
            child: Icon(Icons.pool),
          ),
          Positioned(
            right: 100.0,
            top: 0.0,
            child: SizedBox(
                width: 80.0,
                height: 100.0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: [
                        Color.fromRGBO(7, 102, 255, 1),
                        Colors.lightBlue
                      ])),
                  child: Icon(
                    Icons.brightness_2,
                    color: Colors.white,
                    size: 32.0,
                  ),
                )),
          ),
          Positioned(
              top: 20.0,
              right: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white)),
          Positioned(
              top: 50.0,
              right: 50.0,
              child: Icon(Icons.ac_unit, color: Colors.white)),
          Positioned(
              top: 70.0,
              right: 30.0,
              child: Icon(Icons.ac_unit, color: Colors.white)),
          Positioned(
              top: 150.0,
              right: 50.0,
              child: Icon(Icons.ac_unit, color: Colors.white)),
          Positioned(
              top: 200.0,
              right: 100.0,
              child: Icon(Icons.ac_unit, color: Colors.white)),
          Positioned(
              top: 180.0,
              right: 150.0,
              child: Icon(Icons.ac_unit, color: Colors.white))
        ],
      ),
    );
  }
}
