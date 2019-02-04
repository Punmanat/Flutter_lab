import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabbar"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.account_box),text: "account_box",),
              Tab(icon: Icon(Icons.camera), text: "camera",),
              Tab(icon: Icon(Icons.calendar_today),text:"Calendar")
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.account_box),
            Icon(Icons.camera),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MyHomePageState();
//   }
// }

// class MyHomePageState extends State<MyHomePage> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello, World....."),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("$counter"),
//             Text("-------1-------"),
//             Text("-------1-------"),
//             Text("-------1-------"),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           setState(() {
//             counter++;
//           });
//           print("Counter : $counter");
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello, World....."),
//       ),
//       body: Text("$counter"),
//       floatingActionButton: IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () {
//           counter++;
//           print("Counter : $counter");
//         },
//       ),
//     );
//   }
// }
