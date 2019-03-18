import 'package:flutter/material.dart';
import '../model/todo.dart';

class TodoScreen extends StatelessWidget {
  TodoProvider todo = TodoProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoScreen"),
      ),
      body: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Open DB"),
              onPressed: () {
                todo.open("todo.db");
              },
            ),
            RaisedButton(
              child: Text("Insert"),
              onPressed: () async {
                Todo data = Todo();
                data.title = "Test";
                data.done = false;
                Todo result = await todo.insert(data);
                print(result.title);
                // todo.insert(data).then((result)=>{
                // });
              },
            ),
            RaisedButton(
              child: Text("Get"),
              onPressed: () async {
                Todo data = await todo.getTodo(2);
                print(data.toMap());
              },
            ),
            RaisedButton(
              child: Text("Update"),
              onPressed: () async {
                Todo newData = Todo();
                newData.id = 1;
                newData.title = "New Test";
                newData.done = true;

                int result = await todo.update(newData);
                print(result);
              },
            ),
            RaisedButton(
              child: Text("Delete"),
              onPressed: () async {
                int result = await todo.delete(1);
              },
            ),
            RaisedButton(
              child: Text("Close DB"),
              onPressed: () {
                todo.close();
              },
            )
          ],
        ),
      ),
    );
  }
}
