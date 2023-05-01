import 'dart:convert';

import 'package:bankhoo/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class CategoryService {
  static String apiUrl = "https://fakestoreapi.com/products/category/";
  static String apiUrlCategory = "https://fakestoreapi.com/products/categories/";
  static const String _categoriesKey = "categories";

  static Future<List<String>> getCategories() async {
    final prefs = await SharedPreferences.getInstance(); 
    final categoriesJson = prefs.getString(_categoriesKey);
    if (categoriesJson !=null) {
      final categoriesList = json.decode(categoriesJson) as List<String>;
      final articles = categoriesList.map((e) => e.toString()).toList();
      print("local category\n$articles");
      return articles;
    } else {
      final response = await http.get(Uri.parse(apiUrlCategory));
      if (response.statusCode ==200) {
        final articleJson = response.body;
        final List<dynamic> listArticles = json.decode(articleJson);
        final articles = listArticles.map((e) => e.toString()).toList();
        print("api catgory article\n $articles");
        return articles;
      } else{
        throw Exception("Failed to load Category Articles");
      }
    }
  }


  static Future<List<Article>> getCategoryArticles(String category) async {
    String url = apiUrl + category;
    print("$url url");
    final prefs = await SharedPreferences.getInstance(); 
    final categoriesJson = prefs.getString(_categoriesKey);
    if (categoriesJson !=null) {
      final categoriesList = json.decode(categoriesJson) as List<dynamic>;
      final articlesCategory = categoriesList.map((artilce_) => Article.fromJson(artilce_)).toList();
      print("local category\n$articlesCategory");
      return articlesCategory;
    } else {
      final response = await http.get(Uri.parse(apiUrl + category));
      if (response.statusCode ==200) {
        final articleJson = response.body;
        final listArticles = json.decode(articleJson) as List<dynamic>;
        final articles = listArticles.map((article) => Article.fromJson(article)).toList();
        print("api catgory article\n $articles");
        return articles;
      } else{
        throw Exception("Failed to load Category Articles");
      }
    }
  }
}