class LoginValidator {
  String validateUsername(String username) {
    if (!username.contains("@")) {
      return "please enter a valid username";
    }
    return null;
  }

  String validatePassword(String password) {
    if(password.length < 8) {
      return "please enter a least a password with 8 characters";
    }
    return null;
  }
}