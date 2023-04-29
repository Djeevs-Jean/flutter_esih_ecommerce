import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/_details/details_page.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/article.dart';
import 'package:bankhoo/_widget.dart';

class NavigationFavorites extends StatefulWidget {
  // List listFavorites = DataApp.listFavorites;
  final String imageUrl = "https://placehold.co/300x400.png";
  final String description = "l'est toujours présent dans la liste des processus du système";
  List listFavorites = DataApp.listFavorites;

  NavigationFavorites({super.key});

  @override
  State<NavigationFavorites> createState() => _NavigationFavoritesState();
}

class _NavigationFavoritesState extends State<NavigationFavorites> {

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
          return ListCard(
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


class NavigationPage2 extends StatefulWidget {
  const NavigationPage2({super.key});

  @override
  State<NavigationPage2> createState() => _NavigationPage2State();
}

class _NavigationPage2State extends State<NavigationPage2> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("NavigationPage 2 NavigationPage2"));
  }
}
