import 'package:flutter_ecommerce/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static const String _host = "https://fakestoreapi.com";

  static Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode==200) {
      dynamic json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

  static Future<http.Response> post(String url, Map<String, dynamic> value) async {
    final response = await http.post(Uri.parse(url),
      headers: {"content-type": "application/json"},
      body: jsonEncode(value)
    );
    return response;
  }
  
  static Future<bool> login(Map<String, String> value) async {
    final response = await post("$_host/auth/login", value);
    if(response.statusCode==200 && jsonDecode(response.body)['token'] != null) {
      return true;
    }else {
      return false;
    }
  }

  static Future<List<Product>> getProducts() async {
    try {
      final response = await get("$_host/products") as List<dynamic>;    
      List<Product> listArticles = response.map((item) => Product.fromJson(item)).toList();
      return listArticles;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<List<dynamic>> getTopCategories() async {
    try {
      final response = await get("$_host/products/categories?sort=desc&limit=4") as List<dynamic>;    
      return response;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<List<Product>> getTopProducts() async {
    try {
      final response = await get("$_host/products?sort=desc&limit=6") as List<dynamic>;    
      List<Product> listArticles = response.map((item) => Product.fromJson(item)).toList();
      return listArticles;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<List<Product>> getProductsByCategory(String categoryName) async {
    try {
      final response = await get("$_host/products/category/$categoryName") as List<dynamic>;    
      List<Product> listArticles = response.map((item) => Product.fromJson(item)).toList();
      return listArticles;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<dynamic> getUser(username) async{
    try {
      List users = await get("https://fakestoreapi.com/users");
      users.retainWhere((element) => element["username"]==username);
      return users[0];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}