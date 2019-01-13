import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _usernameController = new TextEditingController();
  final _passwordController = new TextEditingController();
  String greetings = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Form")),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: [
          Icon(Icons.face, size: 80.0, color: Colors.lightGreen),
          Container(height: 20.0),
          _loginCard(),
          Container(height: 20.0),
          Text(greetings,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              textAlign: TextAlign.center,

          )
        ]
      ),
    );
  }

  Widget _loginCard() {
    return Container(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _username(),
            _password(),
            Container(height: 40.0),
            _actions()]
          ,
        )
      )
    );
  }

  Widget _username() {
    return TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.account_box),
          hintText: "username"
        ),
        controller: _usernameController,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        autofocus: true,
        obscureText: false,
        autocorrect: false,
        maxLengthEnforced: false
    );
  }

  Widget _password() {
    return TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: "password"
        ),
        controller: _passwordController,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        autofocus: true,
        obscureText: true,
        autocorrect: false,
        maxLengthEnforced: false
    );
  }

  Widget _actions() {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            child: Text("Login", style: TextStyle(color: Colors.white)),
            onPressed: tapInLogin,
            color: Colors.redAccent
        ),
        Container(width: 60.0),
        RaisedButton(
            child: Text("Clear", style: TextStyle(color: Colors.white)),
            onPressed: tapInClear,
            color: Colors.redAccent
        ),
    ]
    );
  }

  tapInClear() {
    setState(() {
      _usernameController.clear();
      _passwordController.clear();
    });
  }

  tapInLogin() {
    setState(() {
      if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        greetings = "Welcome, ${_usernameController.text}";
      }
    });
  }
}

