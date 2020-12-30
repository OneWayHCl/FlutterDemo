import 'package:FlutterDemo/demo/state/scoped_model_demo.dart';
import 'package:flutter/material.dart';

class InheritedDemmo extends StatefulWidget {
  InheritedDemmo({Key key}) : super(key: key);

  @override
  _InheritedDemmoState createState() => _InheritedDemmoState();
}

class _InheritedDemmoState extends State<InheritedDemmo> {
  int _count = 0;
  void _callback() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountProvider(
        count: _count,
        callback: _callback,
        child: Scaffold(
          appBar: AppBar(
            title: Text('InheritedDemmo'),
          ),
          body: CountWapper(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScopedModelDemmo()));
            },
          ),
        ));
  }
}

class CountWapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count1 = CountProvider.of(context).count;
    final VoidCallback callback = CountProvider.of(context).callback;

    return Center(
      child: ActionChip(
        label: Text('$count1'),
        onPressed: callback,
      ),
    );
  }
}

class CountProvider extends InheritedWidget {
  final int count;
  final VoidCallback callback;
  final Widget child;
  CountProvider({this.count, this.callback, this.child}) : super(child: child);

  static CountProvider of(BuildContext context) =>
      // ignore: deprecated_member_use
      context.inheritFromWidgetOfExactType(CountProvider);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
