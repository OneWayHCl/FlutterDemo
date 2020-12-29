import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () {
        debugPrint('FloatingActionButton');
      },
      elevation: 0.0,
      backgroundColor: Theme.of(context).accentColor,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
        onPressed: () {
          debugPrint('FloatingActionButton.extended');
        },
        icon: Icon(Icons.add),
        label: Text('Add'));
    return Scaffold(
      appBar: AppBar(title: Text('FloatingActionButton')),
      body: ListView(
        children: [],
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 88.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
