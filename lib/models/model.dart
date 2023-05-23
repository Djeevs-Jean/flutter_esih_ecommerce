import 'dart:convert';

class Category {
  final String? name;

  Category({this.name});

  factory Category.fromJson(String data) {
    return Category(name: data);
  }
}

class Product {
  final int id;
  final String title;
  final String price;
  final String description;
  final String image;
  final String category;

  Product({required this.id, required this.title, required this.price, required this.category,  required this.description, 
    required this.image });

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
      id: jsonData['id'], 
      title: jsonData['title'], 
      price: jsonData['price'].toString(), 
      description: jsonData['description'], 
      image: jsonData['image'], 
      category: jsonData['category'], 
    );
  }
}

class User {
  final String? id;
  final String? username;

  User({this.id, this.username});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'], 
      username: map['username']
    );
  }

  factory User.fromJson(String data) {
    final json = jsonDecode(data);
    return User.fromMap(json);
  }

  Map<String, dynamic> toMap(User user) {
    Map<String, dynamic> map = {'id': user.id, 'username': user.username};
    return map;
  }

  String toJson(Map<String, dynamic> map) {
    final json = jsonEncode(map);
    return json;
  }

}