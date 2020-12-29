import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  DateTimeDemo({Key key}) : super(key: key);

  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectDate = DateTime.now();
  Future<void> selectDateTap() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2030));

    if (date == null) {
      return;
    } else {
      setState(() {
        selectDate = date;
      });
    }
  }

  TimeOfDay selectTime = TimeOfDay(hour: 8, minute: 30);
  Future<void> selectTimeTap() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (time == null) return;
    setState(() {
      selectTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: selectDateTap,
              child: Row(
                children: [
                  Text(DateFormat.yMd().format(selectDate)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            InkWell(
              onTap: selectTimeTap,
              child: Row(
                children: [
                  Text(selectTime.format(context)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
