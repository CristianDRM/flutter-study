import 'dart:async';

class LoginValidator {

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
    handleData: (username, sink) {
      if (username.contains("@")) {
        sink.add(username);
      } else {
        sink.addError("invalid username!");
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 8) {
        sink.add(password);
      } else {
        sink.addError("invalid password");
      }
    }
  );
}