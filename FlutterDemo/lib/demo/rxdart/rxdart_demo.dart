import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDartDemo')),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();
    // _textFieldSubject.listen((value) => print(value));
    // _textFieldSubject.map((value) => 'item: $value').listen((value) => print(value));
    // _textFieldSubject
    //     .where((item) => item.length > 10)
    //     .listen((value) => print(value));

    _textFieldSubject
        .debounceTime(Duration(milliseconds: 500))
        .listen((value) => print(value));

    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    _subject.add('hello');
    _subject.add('nihao');
    _subject.add('Hi!');
    _subject.listen((value) {
      print('listen1:$value');
    });

    _subject.listen((value) {
      print('listen2:${value.toUpperCase()}');
    });

    _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: TextField(
          onChanged: (value) {
            _textFieldSubject.add(' input: $value');
          },
          onSubmitted: (value) {
            _textFieldSubject.add('submit: $value');
          },
          decoration: InputDecoration(labelText: 'Title', filled: true),
        ));
  }
}
