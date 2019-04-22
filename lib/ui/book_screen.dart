import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookScreenState();
  }
}

class BookScreenState extends State<BookScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: title,
                decoration: InputDecoration(labelText: "Title"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill title";
                  }
                },
              ),
              TextFormField(
                controller: author,
                decoration: InputDecoration(labelText: "Author"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill author";
                  }
                },
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    //save to cloud fire store
                    // Firestore.instance.collection("books").add({
                    //   "title": title.text,
                    //   "author": author.text,
                    // }).then((doc) {
                    //   print(doc.toString());
                    // });
                    Firestore.instance
                        .collection('books')
                        .document('X1')
                        .setData({
                      "title": title.text,
                      "author": author.text,
                    }).then((x) {
                      print("success");
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
