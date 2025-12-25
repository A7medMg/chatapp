import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<void> saveLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}