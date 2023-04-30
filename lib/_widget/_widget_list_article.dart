import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/_widget/_widget_article.dart';
import 'package:bankhoo/pages/_details/details_page.dart';

class WidgetListProduit extends StatefulWidget {
  final List<dynamic> listArticles;
  final List<dynamic> listFavorites;
  final List<dynamic> listCart;
  const WidgetListProduit({Key? key, required this.listArticles, required this.listFavorites, required this.listCart}) : super(key: key);

  @override
  State<WidgetListProduit> createState() => _WidgetListProduitState();
}

class _WidgetListProduitState extends State<WidgetListProduit> {

  List listArticles = DataApp.getListArticles();
  List listFavorites = DataApp.listFavorites;
  List listCart = DataApp.listCart;

  void navigateToArticleDetailPage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(article: article)));
  }

  void favoritesTap(Article article) {
      setState(() {
        print(article);
        if (!widget.listFavorites.contains(article)) {
          widget.listFavorites.add(article);
        }
      });
    }

  void addToCart(Article article) {
      setState(() {
        print(article);
        if (!widget.listCart.contains(article)) {
          widget.listCart.add(article);
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 320
        ), 
        itemCount: widget.listArticles.length,
        itemBuilder: (_, index) {
          return ArticleWidget(
            article: widget.listArticles[index],
            onCartTap: () {
              print("images");
              addToCart(widget.listArticles[index]);
            },
            onFavoriteTap: () {
              print("favorite");
              favoritesTap(widget.listArticles[index]);
            },
            onTapDetailsMeth: () {
              print("vart");
              navigateToArticleDetailPage(widget.listArticles[index]);
            },
          );
    });
  }
}

