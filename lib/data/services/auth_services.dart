class AuthService {
  static String? registeredEmail;
  static String? registeredPassword;

  static bool register(String email, String password) {
    registeredEmail = email;
    registeredPassword = password;
    return true;
  }

  static bool login(String email, String password) {
    return email == registeredEmail && password == registeredPassword;
  }

  static void logout() {}
}
