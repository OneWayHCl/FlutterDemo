import 'package:flutter/material.dart';

import 'inherited_demo.dart';

class StateMgrDemmo extends StatefulWidget {
  StateMgrDemmo({Key key}) : super(key: key);

  @override
  _StateMgrDemmoState createState() => _StateMgrDemmoState();
}

class _StateMgrDemmoState extends State<StateMgrDemmo> {
  int _count = 0;
  void _callback() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateMgrDemo'),
      ),
      body: CountWapper(_count, _callback),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => InheritedDemmo()));
        },
      ),
    );
  }
}

class CountWapper extends StatelessWidget {
  final int count;
  final VoidCallback callback;

  CountWapper(this.count, this.callback);

  @override
  Widget build(BuildContext context) {
    return Counter(count, callback);
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback callback;

  Counter(this.count, this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: callback,
      ),
    );
  }
}
