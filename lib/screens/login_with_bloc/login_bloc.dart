import 'dart:async';
import 'package:exercise/screens/login_with_bloc/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with LoginValidator {
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get username => _username.stream.transform(validateUsername);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValue => Observable.combineLatest2(username, password, (username, password) => true);

  submit() {
    print("username: ${_username.value} password: ${_password.value}");
  }

  dispose() {
    _username.close();
    _password.close();
  }
}