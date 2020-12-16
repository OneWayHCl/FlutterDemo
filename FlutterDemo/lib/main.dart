import 'package:flutter/material.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawer_demo.dart';
// import 'demo/my_list_view.dart';
import 'demo/test_view.dart';
import 'demo/basic_demo.dart';
// import 'demo/bottom_bar.dart';
//debug

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home:
            // Tabs()
            DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      '你好,Flutter',
                      style: TextStyle(color: Colors.orange),
                    ),
                    // leading: IconButton(
                    //     icon: Icon(Icons.menu),
                    //     onPressed: () => debugPrint('Left button is pressed.')),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () =>
                              debugPrint('Search button is pressed.')),
                      IconButton(
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {
                            debugPrint('Search button is pressed.');
                          }),
                    ],
                    bottom: TabBar(
                        unselectedLabelColor: Colors.black45,
                        labelColor: Colors.black87,
                        tabs: [
                          Tab(icon: Icon(Icons.local_florist)),
                          Tab(icon: Icon(Icons.change_history)),
                          Tab(icon: Icon(Icons.directions_bike)),
                          Tab(icon: Icon(Icons.view_quilt)),
                        ]),
                  ),
                  drawer: DrawerDemo(),
                  endDrawer: DrawerDemo(),
                  body: TabBarView(
                    children: [
                      MyTestView1(),
                      MyTestView2(),
                      MyTestView3(),
                      BasicDemo(),
                    ],
                  ),
                  bottomNavigationBar: BottomNavigationBarDemo(),
                )));
  }
}
