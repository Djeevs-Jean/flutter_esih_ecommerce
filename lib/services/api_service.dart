import 'dart:convert';
import 'package:bankhoo/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class APIServices {

  // static
  Future<List<Article>> get(String urlEndpoint) async {
    final response = await http.get(Uri.parse(urlEndpoint));
    List<Article> listArticles = [];

    if (response.statusCode == 200) {
      print(true);
      print(1);
      List<dynamic> body = jsonDecode(response.body);
      listArticles = body.map((item) => Article.fromJSON(item)).toList();
      print(listArticles);
    } else {
      throw Exception('Failed to fecth article');
    }
    return listArticles;
  }

  Future<List<Article>> getArticlesFromJSONFile() async {
    List<Article> listArticles = [];
    final String jsonString = await rootBundle.loadString('assets/data/data_article.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    listArticles = jsonList.map((json) => Article.fromJSON(json)).toList();
    return listArticles;
  }
}