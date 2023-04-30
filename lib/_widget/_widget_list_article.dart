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
  final String article;
  final String imageUrl = "https://placehold.co/300x400.png";
  const _ArticleWidgetSingle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          InkWell(onTap: () {}, child: Container(
            margin: EdgeInsets.all(8),
            child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity, height: 120, ),
          ),),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
                child: Text("Article",style:  TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              ),

          ),

          Container(
            alignment: Alignment.centerLeft,
            child: Text("Write description of products", style: TextStyle(
              fontSize: 15, 
              color: Colors.blue,
            ),),
          ),

          const SizedBox(height: 8,),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (() => null), icon: const Icon(Icons.favorite)),
              IconButton(onPressed: (() => null), icon: const Icon(Icons.shopping_cart)),
            ],
          ),
          ),
            // Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity, height: 170,),
        ],
      ),
    );
  }
}


class ProductListWidget extends StatefulWidget {
  final List<Article> listArticles;
  // final List<dynamic> listFavorites;
  // final List<dynamic> listCart;
  const ProductListWidget({Key? key, required this.listArticles}) : super(key: key);

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}


class _ProductListWidgetState extends State<ProductListWidget> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      childAspectRatio: 0.50,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: const [
        _ArticleWidgetSingle(article: "Data"),
      ],
    );
  }
}