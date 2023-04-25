import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static Future<dynamic> get(String urlEndpoit) async {
    final response = await http.get(Uri.parse(urlEndpoit));
    if (response.statusCode == 200) {
      
    }
  }
}