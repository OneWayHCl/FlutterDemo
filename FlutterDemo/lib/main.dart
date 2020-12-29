import 'package:FlutterDemo/demo/post_description.dart';
import 'package:flutter/material.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/my_list_view.dart';
import 'demo/page_view_demo.dart';
import 'demo/grid_view_demo.dart';
import 'demo/sliver_view_demo.dart';
import 'demo/test_view.dart';
import 'demo/basic_demo.dart';
import 'data/post.dart';
import 'demo/from_demo.dart';
import 'demo/material_components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        // initialRoute: '/mtc',
        routes: {
          '/detail': (context) => PostShow(post: posts[0]),
          '/from': (context) => FromDemo(),
          '/mtc': (context) => MaterialComponentDemo()
        },
        home: MaterialComponentDemo()
        // Tabs()
        // DefaultTabController(
        //     length: 4,
        //     child: Scaffold(
        //       appBar: AppBar(
        //         centerTitle: true,
        //         title: Text(
        //           '你好,Flutter',
        //           style: TextStyle(color: Colors.red),
        //         ),
        //         leading: Builder(
        //             builder: (context) => IconButton(
        //                   icon: Icon(Icons.menu),
        //                   onPressed: () =>
        //                       Scaffold.of(context).openDrawer(),
        //                 )),
        //         actions: [
        //           IconButton(
        //               icon: Icon(Icons.search),
        //               onPressed: () =>
        //                   debugPrint('Search button is pressed.')),
        //           Builder(
        //               builder: (context) => IconButton(
        //                   icon: Icon(Icons.more_horiz),
        //                   onPressed: () {
        //                     Scaffold.of(context).openEndDrawer();
        //                   }))
        //         ],
        //         bottom: TabBar(
        //             unselectedLabelColor: Colors.black45,
        //             labelColor: Colors.black87,
        //             tabs: [
        //               Tab(icon: Icon(Icons.local_florist)),
        //               Tab(icon: Icon(Icons.change_history)),
        //               Tab(icon: Icon(Icons.directions_bike)),
        //               Tab(icon: Icon(Icons.view_quilt)),
        //             ]),
        //       ),
        //       drawer: DrawerDemo(),
        //       endDrawer: DrawerDemo(),
        //       body: TabBarView(
        //         children: [
        //           MyTestView1(),
        //           MyListView(
        //             items: posts,
        //           ),
        //           SliverViewDemo(), //GridViewDemo(), //or ViewDemo(),
        //           BasicDemo(),
        //         ],
        //       ),
        //       floatingActionButton: FloatingActionButton(
        //         child: Text('From'),
        //         onPressed: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => FromDemo()));
        //         },
        //       ),
        //       bottomNavigationBar: BottomNavigationBarDemo(),
        //     ))
        );
  }
}
