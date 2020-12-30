import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelDemmo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: CounterModel(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('InheritedDemmo'),
            ),
            body: CountWapper(),
            floatingActionButton: ScopedModelDescendant<CounterModel>(
              rebuildOnChange: false,
              builder: (context, _, model) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: model.callback,
              ),
            )));
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
    return ScopedModelDescendant<CounterModel>(
        builder: (context, _, model) => Center(
              child: ActionChip(
                label: Text('${model.count}'),
                onPressed: model.callback,
              ),
            ));
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void callback() {
    _count += 1;
    notifyListeners();
  }
}
