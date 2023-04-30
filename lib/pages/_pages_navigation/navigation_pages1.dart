import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/pages/_details/details_page.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/_widget/_widget_article.dart';

class FavoritePage extends StatefulWidget {
  // List listFavorites = DataApp.listFavorites;
  final String imageUrl = "https://placehold.co/300x400.png";
  final String description = "l'est toujours présent dans la liste des processus du système";
  List listFavorites = DataApp.listFavorites;

  FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  void navigateToArticleDetailPage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(article: article)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 320
        ), 
        itemCount: widget.listFavorites.length,
        itemBuilder: (_, index) {
          return ArticleWidget(
            article: widget.listFavorites[index],
            onCartTap: () {
              print("images");
              // addToCart(widget.listArticles[index]);
            },
            onFavoriteTap: () {
              print("favorite");
              // favoritesTap(widget.listArticles[index]);
            },
            onTapDetailsMeth: () {
              print("vart");
              // navigateToArticleDetailPage(widget.listArticles[index]);
            },
          );
        })
    );
    
  }
}


class CartPage extends StatefulWidget {
  List listCarts = DataApp.listCart;
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 320
        ), 
        itemCount: widget.listCarts.length,
        itemBuilder: (_, index) {
          return ArticleWidget(
            article: widget.listCarts[index],
            onCartTap: () {
              print("images");
              // addToCart(widget.listArticles[index]);
            },
            onFavoriteTap: () {
              print("favorite");
              // favoritesTap(widget.listArticles[index]);
            },
            onTapDetailsMeth: () {
              print("vart");
              // navigateToArticleDetailPage(widget.listArticles[index]);
            },
          );
        })
    );
  }
}
