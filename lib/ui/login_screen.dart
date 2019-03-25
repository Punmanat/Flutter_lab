import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) return "Password is required";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Sign in"),
                      onPressed: () {
                        auth
                            .signInWithEmailAndPassword(
                                email: "x@x.com", password: "12345678")
                            .then((FirebaseUser user) {
                          if (user.isEmailVerified) {
                            print("go to home");
                          } else {
                            print("Please verified your email");
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              FlatButton(
                child: Text("Register New Account"),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
