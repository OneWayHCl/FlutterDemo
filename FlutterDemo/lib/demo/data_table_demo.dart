import 'package:flutter/material.dart';
import '../data/post.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo({Key key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortcolumIndex = 0;
  bool _sortAsc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DataTable(
              sortColumnIndex: _sortcolumIndex,
              sortAscending: _sortAsc,
              columns: [
                DataColumn(
                    label: Container(
                      color: Colors.yellow,
                      // width: 250.0,
                      child: Text('Titel'),
                    ),
                    onSort: (int index, bool sortAsc) {
                      setState(() {
                        _sortcolumIndex = index;
                        _sortAsc = sortAsc;

                        posts.sort((a, b) {
                          if (!sortAsc) {
                            final c = a;
                            a = b;
                            b = c;
                          }
                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    }),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('图片'))
              ],
              // rows: [
              //   DataRow(
              //       cells: [DataCell(Text('Hello')), DataCell(Text('Hello-1'))]),
              //   DataRow(
              //       cells: [DataCell(Text('Hello')), DataCell(Text('Hello-2'))]),
              // ]
              rows: posts.map((post) {
                return DataRow(
                    selected: post.selected,
                    onSelectChanged: (bool value) {
                      setState(() {
                        post.selected = value;
                      });
                    },
                    cells: [
                      DataCell(Text(post.author)),
                      DataCell(Text(post.title)),
                      DataCell(Image.network(post.imageUrl))
                    ]);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
