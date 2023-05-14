import 'package:flutter_ecommerce/models/article.dart';
import 'package:flutter_ecommerce/service/api_service.dart';
import 'package:localstorage/localstorage.dart';

class Storage {
  static String _file = "fakestoreapi.json";
  static String _favKey = "fav_key";
  static String _cartKey = "cart_key";
  static String _userKey = "user_key";
  static LocalStorage _storage = LocalStorage(_file);

  static Future<void> addUser(Map<String, dynamic> user) async {
    await _storage.ready;
    await _storage.setItem(_userKey, user);
  }

  static Future<void> delUser() async {
    await _storage.ready;
    await _storage.deleteItem(_userKey);
  }

  static Future<Map<String, dynamic>> getUser() async {
    await _storage.ready;
    return await _storage.getItem(_userKey) ?? {};
  }


  static Future<List<dynamic>> _getFavoriteProducst(String key) async {
    await _storage.ready;
    List idList = await _storage.getItem(key) ?? [];
    final List<Article> products = await APIService.getProducts();
    products.retainWhere((element) => idList.contains(element.id));
    return products;
  }

  static Future<void> _toggleFavoriteProduct(String key, dynamic value) async {
    await _storage.ready;
    List idList = await _storage.getItem(key) ?? [];
    if (idList.contains(value)) {
      idList.remove(value);
    } else {
      idList.add(value);
    }
    await _storage.setItem(key, idList);
  }

  static Future<bool> _isProductInFavorite(String key, int productId) async {
    await _storage.ready;
    List idList = await _storage.getItem(key) ?? [];
    return idList.contains(productId);
  }

  /// Favorite Get favorite product for one user , as a key list 
  static Future<List<Article>> getFavoriteProdcut(int userId) async {
    return await _getFavoriteProducst("$userId$_favKey") as List<Article>;
  }

  static Future<void> toggleAddInFavortite(int userId, dynamic value) async {
    await _toggleFavoriteProduct("$userId$_favKey", value);
  }

  static Future<bool> isProductInFavorite(int userId, int productId) async {
    return await _isProductInFavorite("$userId$_favKey", productId);
  }

  /// Favorite Get panier product for one user , as a key list 
  static Future<List<Article>> getPanierProduct(int userId) async {
    return await _getFavoriteProducst("$userId$_cartKey") as List<Article>;
  }

  static Future<void> togglePanierInShop(int userId, dynamic productId) async {
    await _toggleFavoriteProduct("$userId$_cartKey", productId);
  }

  static Future<bool> isProductInPanier(int userId, int productId) async {
    return await _isProductInFavorite("$userId$_cartKey", productId);
  }



}