import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.red,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {
            debugPrint('新增按钮点击');
          },
        ),
      ],
    );

    final Widget _raisedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
          // data: ThemeData(),
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                  // shape: StadiumBorder(),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))),
          child: RaisedButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.red,
            elevation: 0.0,
            // color: Theme.of(context).accentColor,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {
            debugPrint('新增按钮点击');
          },
        ),
      ],
    );

    final Widget _outlineButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
          // data: ThemeData(),
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                  // shape: StadiumBorder(),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))),
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.red,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // color: Theme.of(context).accentColor,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {
            debugPrint('新增按钮点击');
          },
        ),
      ],
    );

    final Widget _fixdWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.red,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // color: Theme.of(context).accentColor,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
          ),
        )
      ],
    );

    final Widget _expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.red,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // color: Theme.of(context).accentColor,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.red,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // color: Theme.of(context).accentColor,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
          ),
        )
      ],
    );

    final Widget _buttonBar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(
                    padding: EdgeInsets.symmetric(vertical: 32.0))),
            child: ButtonBar(
              children: [
                OutlineButton(
                  onPressed: () {},
                  child: Text('Button'),
                  splashColor: Colors.red,
                  borderSide: BorderSide(color: Colors.black),
                  textColor: Colors.black,
                  highlightedBorderColor: Colors.grey,
                ),
                OutlineButton(
                  onPressed: () {},
                  child: Text('Button'),
                  splashColor: Colors.red,
                  borderSide: BorderSide(color: Colors.black),
                  textColor: Colors.black,
                  highlightedBorderColor: Colors.grey,
                )
              ],
            ))
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _flatButtonDemo,
            _raisedButton,
            _outlineButton,
            _fixdWidthButton,
            _expandedButton,
            _buttonBar
          ],
        ),
      ),
    );
  }
}
