import 'package:flutter/material.dart';
import '../data/post.dart';

class MyListView extends StatelessWidget {
  final List<Post> items;
  const MyListView({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
          items.length,
          (index) => Container(
                height: 240.0,
                color: Colors.lightBlue,
                child: Column(
                  children: [
                    Text('${items[index].title}'),
                    Image.network(
                      '${items[index].imageUrl}',
                      fit: BoxFit.fitHeight,
                      height: 200.0,
                    ),
                    Divider()
                  ],
                ),
              )),
    );
  }
}
