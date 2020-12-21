import 'package:FlutterDemo/data/post.dart';
import 'package:flutter/material.dart';

class SliverViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('小标题'),
          leading: Text(''),
          actions: [Text('')],
          // pinned: true,
          floating: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'SpaceFlexib'.toUpperCase(),
              style: TextStyle(color: Colors.white, letterSpacing: 5.0),
            ),
            background: Image.network(
              posts[1].imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SliverSafeArea(
            sliver: SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverListDemo(),
        ))
      ],
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
              // type: MaterialType.card,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child:
                        Image.network(posts[index].imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                      left: 20.0,
                      top: 20.0,
                      child: Text(
                        '${posts[index].title}',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )));
    }, childCount: posts.length));
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 16 / 9),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
              child: Image.network(posts[index].imageUrl, fit: BoxFit.cover));
        }, childCount: posts.length));
  }
}
