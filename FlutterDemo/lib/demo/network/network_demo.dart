import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class NetworkDemo extends StatelessWidget {
  const NetworkDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetworkDemo'),
        elevation: 0.0,
      ),
      body: NetworkDemoHome(),
    );
  }
}

class NetworkDemoHome extends StatefulWidget {
  NetworkDemoHome({Key key}) : super(key: key);

  @override
  _NetworkDemoHomeState createState() => _NetworkDemoHomeState();
}

class _NetworkDemoHomeState extends State<NetworkDemoHome> {
  @override
  void initState() {
    super.initState();
    // fetchPosts().then((value) => print(value));

    // final post = {'title': 'hello~', 'description': 'nice to meet you.'};
    // print(post['title']);
    // print(post['description']);

    // final postJson = json.encode(post); // Map => Json
    // print(postJson);
    // final postJsonConverted = json.decode(postJson); //Json => Map
    // print(postJsonConverted['title']);
    // print(postJsonConverted['description']);
    // print(postJsonConverted is Map);

    // final postModel = Post.fromJson(postJsonConverted); //Map => Model
    // print(postModel.title);
    // print(postModel.description);

    // print('${json.encode(postModel)}');
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    // print('response.statusCode${response.statusCode}');
    // print('response.body${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          }
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
        });
  }
}

class Post {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Post(this.id, this.title, this.description, this.author, this.imageUrl);

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        author = json['author'],
        imageUrl = json['imageUrl'],
        description = json['description'];

  Map toJson() => {'title': title, 'description': description};
}
