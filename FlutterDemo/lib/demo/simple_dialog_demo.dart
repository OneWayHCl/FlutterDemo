import 'package:flutter/material.dart';
import 'dart:async';

enum Option { A, B, C }
enum Action { OK, Cancle }

class SimpleDialogDemo extends StatefulWidget {
  SimpleDialogDemo({Key key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpaned;

  ExpansionPanelItem({this.headerText, this.body, this.isExpaned});
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choose = 'Nothing';
  //Future<void>
  Future _openSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: [
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              ),
            ],
          );
        });

    switch (option) {
      case Option.A:
        setState(() {
          _choose = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choose = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choose = 'C';
        });
        break;
      default:
    }
  }

  String _chooseA = 'Nothing';
  Future _openAlertDialog() async {
    final chose = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Action.OK);
                  },
                  child: Text('确定')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Action.Cancle);
                  },
                  child: Text('取消')),
            ],
          );
        });
    switch (chose) {
      case Action.OK:
        setState(() {
          _chooseA = 'OK';
        });
        break;
      case Action.Cancle:
        setState(() {
          _chooseA = 'Cancle';
        });
        break;
      default:
    }
  }

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  void _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.pause_circle_outline),
              Text('1:30/5:00'),
              Expanded(child: Text('A Expanded'))
            ],
          ),
        ),
      );
    });
  }

  void _openModelBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: [
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                )
              ],
            ),
          );
        });

    print(option);
  }

  bool _isExpanded = false;

  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
          headerText: 'Part A',
          body: Container(
            child: Text('Content Part A'),
          ),
          isExpaned: false),
      ExpansionPanelItem(
          headerText: 'Part B',
          body: Container(
            child: Text('Content Part B'),
          ),
          isExpaned: false),
      ExpansionPanelItem(
          headerText: 'Part C',
          body: Container(
            child: Text('Content Part C'),
          ),
          isExpaned: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _expansionPanelItems[index].isExpaned = !isExpanded;
                  });
                },
                children: _expansionPanelItems.map((ExpansionPanelItem item) {
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          child: Text(item.headerText),
                        );
                      },
                      body: item.body,
                      isExpanded: item.isExpaned);
                }).toList(),
              ),
              Text('SimpleDialog => You choose:$_choose'),
              Text('AlertDialog => You choose:$_chooseA'),
              RaisedButton(
                  child: Text('AlertDialog'), onPressed: _openAlertDialog),
              RaisedButton(
                  child: Text('BottomSheet'), onPressed: _openBottomSheet),
              RaisedButton(
                  child: Text('Modal BottomSheet'),
                  onPressed: _openModelBottomSheet),
              RaisedButton(
                  child: Text('SnackBar'),
                  onPressed: () {
                    // Scaffold.of(context).showSnackBar(SnackBar(
                    //   content: Text('Press loading...'),
                    //   action: SnackBarAction(label: 'OK', onPressed: () {}),
                    // ));
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _openSimpleDialog,
          child: Icon(Icons.format_list_numbered)),
    );
  }
}
