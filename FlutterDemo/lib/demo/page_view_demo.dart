import 'package:flutter/material.dart';
import '../data/post.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({Key key}) : super(key: key);

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
            child: Image.network(posts[index].imageUrl, fit: BoxFit.cover)),
        Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              posts[index].title,
              style: TextStyle(color: Colors.orange, fontSize: 20.0),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: posts.length, itemBuilder: _pageItemBuilder);
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false, //false滑动不翻页
      // reverse: true, //反序页面321
      // scrollDirection: Axis.vertical, //翻页方向(左右/上下)
      onPageChanged: (currentPage) {
        debugPrint('Page:$currentPage');
      },
      controller: PageController(
        initialPage: 1, //初始页码
        // keepPage: false, //false不记住页面滚动的页码
        // viewportFraction: 0.8, //页面占据比例(默认1,全部)
      ),
      children: [
        Container(
          color: Colors.brown[100],
          alignment: Alignment.center,
          child: Text(
            'One',
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.brown[300],
          alignment: Alignment.center,
          child: Text(
            'Two',
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.brown[900],
          alignment: Alignment.center,
          child: Text(
            'Three',
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
