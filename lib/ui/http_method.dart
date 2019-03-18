import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../model/post.dart';
import 'package:lab01/ui/list_view_post.dart';

class ListData extends StatelessWidget {
  Future loadPost() async {
    Response resp = await get("https://jsonplaceholder.typicode.com/posts");
    // print(resp.body);
    List<dynamic> data = json.decode(resp.body);
    List<Post> posts = List();
    data.forEach((d) {
      posts.add(Post.formJson(d));
    });
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("List Data"),
        ),
        body: FutureBuilder(
          future: loadPost(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print("Load data error");
            return snapshot.hasData
                ? ListViewPosts(
                    posts: snapshot.data,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
