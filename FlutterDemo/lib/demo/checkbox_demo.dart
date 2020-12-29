import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  CheckboxDemo({Key key}) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _switchItemA = true;
  bool _checkboxItemA = true;
  int _groupValueA = 0;
  void _groupValueAOnChanged(value) {
    setState(() {
      _groupValueA = value;
    });
  }

  void _switchItemAOnTap(value) {
    setState(() {
      _switchItemA = value;
    });
  }

  double _sliderA = 0.0;
  void _sliderOnChanged(value) {
    setState(() {
      _sliderA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckboxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              value: _switchItemA,
              onChanged: _switchItemAOnTap,
              title: Text('SwitchListTile A'),
              subtitle: Text('subTitle'),
              secondary:
                  Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              selected: _checkboxItemA,
            ),
            Text(_switchItemA ? '😊' : '😭', style: TextStyle(fontSize: 30.0)),
            // Switch(
            //     value: _switchItemA,
            //     activeColor: Colors.black,
            //     onChanged: (value) {
            //       setState(() {
            //         _switchItemA = value;
            //       });
            //     }),
            CheckboxListTile(
              value: _checkboxItemA,
              onChanged: (value) {
                setState(() {
                  _checkboxItemA = value;
                });
              },
              title: Text('CheckboxItem A'),
              subtitle: Text('subTitle'),
              secondary: Icon(Icons.bookmark),
              selected: _checkboxItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Checkbox(
                //     value: _checkboxItemA,
                //     onChanged: (value) {
                //       debugPrint('$value');
                //       setState(() {
                //         _checkboxItemA = value;
                //       });
                //     },
                //     checkColor: Colors.red,
                //     activeColor: Colors.black)
              ],
            ),
            RadioListTile(
              value: 0,
              groupValue: _groupValueA,
              onChanged: _groupValueAOnChanged,
              title: Text('标题1'),
              subtitle: Text('子标题'),
              secondary: Icon(Icons.book),
              selected: _groupValueA == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _groupValueA,
              onChanged: _groupValueAOnChanged,
              title: Text('标题2'),
              subtitle: Text('子标题'),
              secondary: Icon(Icons.bookmark),
              selected: _groupValueA == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Radio(
                //     value: 0,
                //     groupValue: _groupValueA,
                //     activeColor: Colors.black,
                //     onChanged: _groupValueAOnChanged),
                // Radio(
                //     value: 1,
                //     groupValue: _groupValueA,
                //     activeColor: Colors.black,
                //     onChanged: _groupValueAOnChanged),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: _sliderA,
                  onChanged: _sliderOnChanged,
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  label: '${_sliderA.toInt()}',
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('$_sliderA')
          ],
        ),
      ),
    );
  }
}
