import 'package:FlutterDemo/data/post.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //主轴item最多个数
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0),
      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 100, //主轴item最大宽度
      //     crossAxisSpacing: 8.0,
      //     mainAxisSpacing: 8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Text(
          'Item_$index',
          style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 80.0, //网格视图在交叉轴最大的尺寸
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      padding: EdgeInsets.all(16.0),
      // scrollDirection: Axis.horizontal, //改变滚动方向
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Text(
          'Item_$index',
          style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      padding: EdgeInsets.all(16.0),
      scrollDirection: Axis.horizontal, //改变滚动方向
      children: _buildTiles(100),
    );
  }
}
