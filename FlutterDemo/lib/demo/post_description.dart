import 'package:flutter/material.dart';
import '../data/post.dart';

class PostShow extends StatelessWidget {
  const PostShow({Key key, @required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        elevation: 10.0,
      ),
      body: Column(
        children: [
          Text(''),
          Image.network(post.imageUrl, fit: BoxFit.cover, height: 300.0),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(post.author), Text(post.description)],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
