import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/_details/details_page.dart';
import 'package:bankhoo/_widget.dart';
import 'package:bankhoo/article.dart';

class ProductsDrawerPage1 extends StatefulWidget {
  List listArticles = DataApp.getListArticles();
  List listFavorites = DataApp.listFavorites;
  List listCart = DataApp.listCart;
  final String imageUrl = "https://placehold.co/300x400.png";
  final String description = "l'est toujours présent dans la liste des processus du système";
  ProductsDrawerPage1({Key? key}) : super(key: key);


  @override
  State<ProductsDrawerPage1> createState() => _ProductsDrawerPage1State();
}

class _ProductsDrawerPage1State extends State<ProductsDrawerPage1> {

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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("List Produits"))),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 320
        ), 
        itemCount: widget.listArticles.length,
        itemBuilder: (_, index) {
          return ListCard(
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
        })
    )
    );
  }
}

class DrawerPage2 extends StatefulWidget {
  const DrawerPage2({Key? key}) : super(key: key);

  @override
  State<DrawerPage2> createState() => _DrawerPage2State();
}

class _DrawerPage2State extends State<DrawerPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("List Produits")),
          actions: [TextButton(onPressed: () {print("peye");}, child: const Text("PEYE", style: AppTheme.titleHead,))],
        ),
      body: Center(child: Text("DrawerPage 2 DrawerPage2")),
    );
  }
}
