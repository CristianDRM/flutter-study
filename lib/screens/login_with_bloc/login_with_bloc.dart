import 'package:exercise/screens/login_with_bloc/bloc_provider.dart';
import 'package:exercise/screens/login_with_bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginWithBloc extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginWithBlocState();
}

class _LoginWithBlocState extends State<LoginWithBloc> {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Column(children: [
          _username(bloc),
          _password(bloc),
          Container(margin: EdgeInsets.only(top: 20.0)),
          _submit(bloc)
        ]),
    );
  }

  Widget _username(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.username,
      builder: (context, snapshot) {
        return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.changeUsername,
            decoration: InputDecoration(
                hintText: "yourusername@mail.com",
                labelText: "Type your username",
                errorText: snapshot.error
            )
        );
      }
    );
  }

  Widget _password(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Type your password",
                errorText: snapshot.error
            )
        );
      }
    );
  }

  Widget _submit(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValue,
      builder: (context, snapshot) {
        return RaisedButton(
          color: Colors.pink,
          disabledColor: Colors.blueGrey,
          textColor: Colors.white,
          onPressed: () => snapshot.hasData ? bloc.submit() : null,
          child: Text("Login"),
        );
      }
    );
  }
}
