import 'package:exercise/screens/login_with_bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({Key key, Widget child}) : super(key: key, child: child);
  final bloc = LoginBloc();

  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
  }
}