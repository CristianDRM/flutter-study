import 'package:flutter/material.dart';
import 'package:exercise/screens/newlogin/login_validator.dart';

class LoginWithForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginWithFormState();
}

class _LoginWithFormState extends State<LoginWithForm> with LoginValidator {
  final formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login with form")),
        body: Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _usernameWidget(),
                  _passwordWidget(),
                  Container(margin: EdgeInsets.only(top: 20.0)),
                  _submit()
                ],
              ),
            )
        )
    );
  }

  Widget _usernameWidget() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Type your username",
          hintText: "youremail@gmail.com"
      ),
      onSaved: (String username) {
        setState(() {
          _username = username;
        });
      },
      validator: validateUsername,
    );
  }

  Widget _passwordWidget() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Type your password"),
      obscureText: true,
      onSaved: (String password) {
        setState(() {
          _password = password;
        });
      },
      validator: validatePassword
    );
  }

  Widget _submit() {
    return RaisedButton(
      child: Text("Login"),
      textColor: Colors.white,
      color: Colors.pink,
      onPressed: () {
        if(formKey.currentState.validate()) {
          formKey.currentState.reset();
        } else {

        }
      },
    );
  }
}
