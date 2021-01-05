import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamMutDemo extends StatelessWidget {
  const StreamMutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream')),
      body: StreamMutHomeDemo(),
    );
  }
}

class StreamMutHomeDemo extends StatefulWidget {
  StreamMutHomeDemo({Key key}) : super(key: key);

  @override
  _StreamMutHomeDemoState createState() => _StreamMutHomeDemoState();
}

class _StreamMutHomeDemoState extends State<StreamMutHomeDemo> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    debugPrint('Stream Create');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    debugPrint('Stream Start');
    // _streamDemoSubscription =
    //     _streamDemo.listen(onData, onError: onError, onDone: onDone);

    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    debugPrint('Stream End');
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    debugPrint('$data');
  }

  void onDataTwo(String data) {
    debugPrint('onDataTwo: $data');
  }

  void onError(error) {
    debugPrint('$error');
  }

  void onDone() {
    debugPrint('onDone');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello~';
    // throw 'Something happend';
  }

  Future<String> fetchData1() async {
    await Future.delayed(Duration(seconds: 1));
    return 'Hello~ addStream';
  }

  void _addStream() async {
    debugPrint('_addStream');
    String data = await fetchData1();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  void _pauseStream() {
    debugPrint('_pauseStream');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    debugPrint('_resumeStream');
    _streamDemoSubscription.resume();
  }

  void _cancleStream() {
    debugPrint('_cancleStream');
    _streamDemoSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        StreamBuilder(
            stream: _streamDemo.stream,
            initialData: '...',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            }),
        Text(_data),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: _addStream, child: Text('Add')),
            FlatButton(onPressed: _pauseStream, child: Text('Pause')),
            FlatButton(onPressed: _resumeStream, child: Text('Resume')),
            FlatButton(onPressed: _cancleStream, child: Text('Cancle'))
          ],
        ),
      ]),
    );
  }
}
