import 'dart:convert';
import 'package:bankhoo/models/articles.dart';
import 'package:http/http.dart' as http;

class APIServices {

  // static
  Future<List<Article>> get(String urlEndpoint) async {
    final response = await http.get(Uri.parse(urlEndpoint));
    List<Article> listArticles = [];

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      listArticles = body.map((item) => Article.fromJSON(item)).toList();
    } else {
      throw Exception('Failed to fecth article');
    }
    return listArticles;
  }
}