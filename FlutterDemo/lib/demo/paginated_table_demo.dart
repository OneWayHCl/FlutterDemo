import '../data/post.dart';
import 'package:flutter/material.dart';

class PostDataSoucre extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(post.author)),
      DataCell(Text(post.title)),
      DataCell(Image.network(post.imageUrl))
    ]);
  }

  void _sort(getFeild(post), columnAscending) {
    _posts.sort((a, b) {
      if (!columnAscending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getFeild(a);
      final bValue = getFeild(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class PaginatedTableDemo extends StatefulWidget {
  PaginatedTableDemo({Key key}) : super(key: key);

  @override
  _PaginatedTableDemoState createState() => _PaginatedTableDemoState();
}

class _PaginatedTableDemoState extends State<PaginatedTableDemo> {
  int _sortcolumIndex = 0;
  bool _sortAsc = false;
  final PostDataSoucre _postDataSoucre = PostDataSoucre();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PaginatedDataTable(
                header: Text('Posts'),
                rowsPerPage: 5,
                source: _postDataSoucre,
                sortColumnIndex: _sortcolumIndex,
                sortAscending: _sortAsc,
                columns: [
                  DataColumn(
                      label: Container(
                        color: Colors.yellow,
                        // width: 250.0,
                        child: Text('Titel'),
                      ),
                      onSort: (int columnIndex, bool columnAscending) {
                        _postDataSoucre._sort(
                            (post) => post.title.length, columnAscending);
                        setState(() {
                          _sortcolumIndex = columnIndex;
                          _sortAsc = columnAscending;
                        });
                      }),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('图片'))
                ])
          ],
        ),
      ),
    );
  }
}
