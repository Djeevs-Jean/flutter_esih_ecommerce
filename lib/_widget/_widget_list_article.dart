import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/_widget/_widget_article.dart';
import 'package:bankhoo/pages/_details/details_page.dart';

class WidgetListProduit extends StatefulWidget {
  final List<Article> listArticles;
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

class _ArticleWidgetSingle extends StatelessWidget {
  final Article article;
  const _ArticleWidgetSingle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(article.image, width: double.infinity, height: 120, fit: BoxFit.cover, ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title, style: const TextStyle( fontSize: 18, fontWeight: FontWeight.bold, ),),
                const SizedBox(height: 8),
                Text(article.description, style: const TextStyle( fontSize: 16, ),),
                const SizedBox(height: 10),
                Text('Prix :${article.price}\$', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: const Icon(Icons.favorite_border),onPressed: () {}),
                    IconButton(icon: const Icon(Icons.add_shopping_cart),onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}


class ArticleListWidget extends StatefulWidget {
  final List<Article> listArticles;
  const ArticleListWidget({Key? key, required this.listArticles}) : super(key: key);

  @override
  State<ArticleListWidget> createState() => _ArticleListWidgetState();
}


class _ArticleListWidgetState extends State<ArticleListWidget> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      childAspectRatio: 200/400,
      // childAspectRatio: 0.45,
      mainAxisSpacing: 8,
      crossAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: widget.listArticles.map((article) => _ArticleWidgetSingle(article: article)).toList(),
    );
  }
}