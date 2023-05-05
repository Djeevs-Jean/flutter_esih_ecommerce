import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _keyId = 'id';
  static const String _keyUsername = 'username';

  static Future<void> setUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyId, userId);
  }

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyId);
  }

  static Future<void> setUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
  }

  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  static Future<void> login(Map<String, String>user) async {
    await setUserId(user['id'].toString());
    await setUsername(user['username'].toString());
  }

  //  static Future<void> login(int userId, String username) async {
  //   await setUserId(userId);
  //   await setUsername(username);
  // }


  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyId);
    prefs.remove(_keyUsername);
  }



}
