import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  PopupMenuButtonDemo({Key key}) : super(key: key);

  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentItem = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_currentItem),
                PopupMenuButton(
                    onSelected: (value) {
                      setState(() {
                        _currentItem = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            value: 'Home',
                            child: Text('Home'),
                          ),
                          PopupMenuItem(
                            value: 'Mine',
                            child: Text('Mine'),
                          ),
                          PopupMenuItem(
                            value: 'Other',
                            child: Text('Other'),
                          ),
                        ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
