import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Text('测试1'), Text('测试2'), Text('测试3')],
    );
  }
}
