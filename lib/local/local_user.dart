import 'package:shared_preferences/shared_preferences.dart';

class LocalUser {
  // Stocke les données d'un utilisateur connecté
  static Future<void> saveUserData(String userId, String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', userId);
    prefs.setString('username', username);
  }

  // Méthode pour récupérer les données de l'utilisateur connecté
  static Future<Map<String, String>> getLoggedInUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('id');
    final username = prefs.getString('username');
    final userData = <String, String>{};
    if (userId != null) {
      userData['id'] = userId;
    }

    if (username != null) {
      userData['username'] = username;
    }
    return userData;
  }

  // Méthode pour effacer les données de l'utilisateur connecté
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('username');
  }

}