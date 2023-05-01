import 'dart:convert';
import 'package:bankhoo/models/article.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class ArticleService {
  static String apiUrl = "https://fakestoreapi.com/products?limit=5";
  static const String _articlesKey = 'articles';

  static Future<List<dynamic>> getArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final articlesJson = prefs.getString(_articlesKey);
    if (articlesJson != null) {
      final articleList = json.decode(articlesJson) as List<dynamic>;
      final articles = articleList.map((article) => Article.fromJson(article)).toList();
      print("local");
      print("$articles");
      return articles;
    } else {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode==200) {
        final articleJson = response.body;
        final articleList = json.decode(articleJson) as List<dynamic>;
        final articles = articleList.map((article) => Article.fromJson(article)).toList();
        print("api");
        print("$articles");
        return articles;
      } else {
        throw Exception('Failed to load articles');
      }
    }
  } 

  
}