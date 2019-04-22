import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("books").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: snapshot.data.get(index)['title'],
                subtitle: snapshot.data.get(index)['author'],
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

