import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static String? email;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
  }

  static String? getEmail() {
    return email;
  }
  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

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