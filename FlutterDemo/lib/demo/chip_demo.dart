import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  ChipDemo({Key key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['apple', 'banana', 'orange'];
  String _selectTag = 'Nothing';
  List<String> _selected = [];
  String _choice = 'apple';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ChipDemo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: () {
            setState(() {
              _tags = ['apple', 'banana', 'orange'];
              _selected = [];
              _choice = '';
            });
          },
        ),
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(),
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    Chip(label: Text('Lift A')),
                    Chip(label: Text('Lift B'), backgroundColor: Colors.red),
                    SizedBox(width: 180.0),
                    Chip(
                        label: Text('Lift C'),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text('哒'),
                        )),
                    Chip(
                        label: Text('Lift C'),
                        avatar: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://static.enfry.cn/Storage-api/img.api?token=85878D5F87E75BC420E761AE9BBEEC12&fileCode=group1/M00/01/52/wKgBHlnm_pWAZmV3AAF-sBP4pEc4.1.jpg&appKey=enfrytest&ts=3284071923874102938'),
                        )),
                    Chip(
                      label: Text('Lift City'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Text('哒'),
                      ),
                      onDeleted: () {},
                      deleteIcon: Icon(Icons.delete),
                      deleteIconColor: Colors.red,
                      deleteButtonTooltipMessage: 'Remove this tag',
                    ),
                    Divider(
                      color: Colors.red,
                      height: 3.0,
                      indent: 32.0,
                      endIndent: 32.0,
                    )
                  ],
                ),
                Divider(),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text('Select: $_selectTag'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _selectTag = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text('FilterChip: $_selected'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text('ChoiceChip: $_choice'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ));
  }
}
