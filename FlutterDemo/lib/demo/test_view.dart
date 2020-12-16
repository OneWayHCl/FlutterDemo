import 'package:flutter/material.dart';
import './layout_demo.dart';

class MyTestView1 extends StatelessWidget {
  const MyTestView1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: LayoutDemo());
  }
}

class MyTestView2 extends StatelessWidget {
  const MyTestView2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '测试2-测试2',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w800, fontSize: 25.0),
      ),
    );
  }
}

class MyTestView3 extends StatelessWidget {
  const MyTestView3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '测试3-测试3-测试3',
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w800, fontSize: 20.0),
      ),
    );
  }
}

class MyTestHistoryView extends StatelessWidget {
  const MyTestHistoryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '测试-MyTestHistoryView',
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w800, fontSize: 20.0),
      ),
    );
  }
}

class MyTestListView extends StatelessWidget {
  const MyTestListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '测试-MyTestListView',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20.0),
      ),
    );
  }
}

class MyTestMineView extends StatelessWidget {
  const MyTestMineView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '测试-MyTestMineView',
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.w800, fontSize: 20.0),
      ),
    );
  }
}
