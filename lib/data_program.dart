import 'package:flutter_ecommerce/models/article.dart';

class DataProgram {
    static List<Map> listArticles = [];
    static List<Article> listFavorites = [];
    static List<Article> listCart = [];
    static List<Article> listUser = [];

    static final List<String> listCategories = ['Catégorie 1', 'Catégorie 2', 'Catégorie 3'];
  //   final dynamic articles = {'id': 1, 'tile': 'title 1', 'price': 90, 'description': "l'est toujours présent dans la liste des processus du système", 'image':"https://placehold.co/300x400.png" };
  //   final String imageUrl = "https://placehold.co/300x400.png";
  // final String description = "l'est toujours présent dans la liste des processus du système";
  //   static final List<String> listFavorites = [];
    static bool getCategory(Article article) {
      for (var element in listFavorites) {
        if (article.id == element.id) {
          return true;
        }
      }
      return false;
    }

     static _getListUser() {
        return listUser;
      }


    static _getListArticles() {
      for (var i = 1; i < 11; i++) {
        Map<String, dynamic> data = {
          'id': i,
          'title': 'title $i',
          'price': '90${i+1}',
          'category': 'category $i',
          'description':"Dans la liste des processus du système",
          // 'description':"l'est toujours présent dans la liste des processus du système", 
          'image':"https://placehold.co/300x400.png"
        };
        listArticles.add(data);
      }
    }

    static List<Article> getListArticles() {
      _getListArticles();
      List<Article> articles = listArticles.map((article) => Article(id: article['id'], title: article['title'], price: article['price'], category: article['category'], description: article['description'], image: article['image'], inCart: false, isFavorite: false)).toList();
      return articles;
    }

    static void removeFromFavorites(Article article) {
      article.isFavorite = false;
      listFavorites.remove(article);
    }

    static void addToCart(Article article) {
      article.inCart = true;
      listCart.add(article);
    }

    static void removeFromCart(Article article) {
      article.inCart = false;
      listCart.remove(article);
    }

}

