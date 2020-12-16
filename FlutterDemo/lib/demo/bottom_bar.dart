// import 'package:FlutterDemo/demo/basic_demo.dart';
import 'package:flutter/material.dart';
import './test_view.dart';
import './my_list_view.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  //选中的条目
  var _currentIndex = 0;

  //tab对应的body页面
  var _pageList = [MyTestView1(), MyTestView2(), MyTestView3(), MyListView()];

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '你好,Flutter',
          style: TextStyle(color: Colors.orange),
        ),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => debugPrint('Left button is pressed.')),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => debugPrint('Search button is pressed.')),
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                debugPrint('Search button is pressed.');
              }),
        ],
        // bottom: TabBar(
        //     unselectedLabelColor: Colors.black45,
        //     labelColor: Colors.black87,
        //     tabs: [
        //       Tab(icon: Icon(Icons.local_florist)),
        //       Tab(icon: Icon(Icons.change_history)),
        //     ]),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapHandler,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My',
            ),
          ]),
    );
  }
}
