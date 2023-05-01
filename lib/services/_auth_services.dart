import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static String apiUrl = "https://fakestoreapi.com/auth/login";

  static Future<String?> postUser(String username, String password) async {
    final response = await http.post(Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );

    if(response.statusCode==200) {
      final tokenJson = response.body;
      final Map<String, dynamic> token = json.decode(tokenJson);
      final tokens =  token.values.toString();
      print("token $tokens");
      return tokens;
    } 
    return null; 
  }

}