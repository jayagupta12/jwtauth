import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const STATUS = "Token";

  setUser(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(STATUS, token);
  }

  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(STATUS) ?? "";
  }
}