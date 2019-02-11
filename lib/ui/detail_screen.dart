import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{
  String title;
  DetailScreen({this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$title screen"),
      ),
      body: Center(
        //a:
        child: FlatButton(
          child: Text("Go to second"),
          onPressed: (){
            Navigator.pushNamed(context, "/second");
          },
        ),
      ),
    );
  }

}