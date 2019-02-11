import 'package:flutter/material.dart';
class MyCustomForm extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }
    
  }

class MyCustomFormState extends State<MyCustomForm>{
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Form"),
        backgroundColor:Colors.orange,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
        key:_formkey,
        child: ListView(
          children: <Widget>[
            Image.asset("resources/cat.jpg",
            height: 100,),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: "User Id",
                hintText: "Enter your email"
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value.isEmpty){
                  return "Please enter some text";
                }
              }
            ),
             TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "Password",
                hintText: "Enter your password"
              ),
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value.isEmpty){
                  return "Please enter some text";
                }
              }
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RaisedButton(
                onPressed: (){
                  if(_formkey.currentState.validate()){
                    Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Processing Data")));
                  }
                },
                child: Text("Submit"),
              ),
            )
          ],
        ),
        ),
      ),
    );
  }

}