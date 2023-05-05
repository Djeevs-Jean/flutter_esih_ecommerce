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

  static Future<Map<String, String>?> getUser(String userid) async{
    final listUser = await _getAllUser();
    for (var element in listUser) {
      if (element['id'] == userid) {
        return element;
      }
    }
    return null; 
  }

  static Future<List<Map<String, String>>> _getAllUser() async {
    final response = await http.get(Uri.parse("https://fakestoreapi.com/users"));
      if (response.statusCode ==200) {
        final jsonUser = response.body;
        final userList = json.decode(jsonUser) as List<dynamic>;

        final List<Map<String, String>> listUserFiltered = userList.map((user) => {
          'id': user['id'].toString(),
          'username': user['username'].toString()
        }).toList();
        
        return listUserFiltered;
      } else{
        throw Exception("Failed to load All user");
      }
  }



}