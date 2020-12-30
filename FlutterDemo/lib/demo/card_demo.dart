import 'package:FlutterDemo/data/post.dart';
import 'package:flutter/material.dart';
import '../data/post.dart';

class CardDemo extends StatefulWidget {
  CardDemo({Key key}) : super(key: key);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                        ),
                        child: Image.network(
                          post.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      )),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(post.imageUrl)),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      post.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonBar(
                    children: [
                      FlatButton(
                          onPressed: () {}, child: Text('Like'.toUpperCase())),
                      FlatButton(
                          onPressed: () {}, child: Text('Read'.toLowerCase()))
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
