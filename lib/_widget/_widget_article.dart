import 'package:bankhoo/models/article.dart';
import 'package:flutter/material.dart';
import 'package:bankhoo/screen/detail_page/product_detail.dart';
import 'package:bankhoo/utils/utils_word.dart';

class ArticleWidgetSingle extends StatefulWidget {
  final Article article;
  final VoidCallback onTapDetailsMeth;
  final VoidCallback onFavoriteTap;
  final VoidCallback onCartTap;
  const ArticleWidgetSingle({Key? key, required this.article, required this.onTapDetailsMeth, required this.onFavoriteTap, required this.onCartTap }) : super(key: key);

  @override
  State<ArticleWidgetSingle> createState() => _ArticleWidgetSingle();
}

class _ArticleWidgetSingle extends State<ArticleWidgetSingle> {

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
          InkWell(
            onTap: (() => widget.onTapDetailsMeth()),
            child: Image.network(widget.article.image, width: double.infinity, height: 120, fit: BoxFit.cover, ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.article.title, style: const TextStyle( fontSize: 12, fontWeight: FontWeight.bold, ),),
                const SizedBox(height: 8),
                Text(UtilsWord.subsWord(widget.article.description), style: const TextStyle( fontSize: 10, ),),
                const SizedBox(height: 10),
                Text('Prix :${widget.article.price}\$', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (() => widget.onFavoriteTap()), icon: const Icon(Icons.favorite_border)),
                    IconButton(onPressed: (() => widget.onCartTap()), icon: const Icon(Icons.add_shopping_cart)),
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

// liste produits

class ArticleListWidget extends StatefulWidget {
  final List<Article> listArticles;
  final List<dynamic> listFavorites;
  final List<dynamic> listCart;
  const ArticleListWidget({Key? key, required this.listArticles, required this.listFavorites, required this.listCart}) : super(key: key);

  @override
  State<ArticleListWidget> createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {

  void navigateToArticleDetailPage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetail(article: article)));
  }

  void favoritesTap(Article article) {
      setState(() {
        if (!widget.listFavorites.contains(article)) {
          widget.listFavorites.add(article);
        }
      });
    }

  void addToCart(Article article) {
      setState(() {
        if (!widget.listCart.contains(article)) {
          widget.listCart.add(article);
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      itemCount: widget.listArticles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
        childAspectRatio: 200/450,
      ),
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
      return ArticleWidgetSingle(
          article: widget.listArticles[index],
            onCartTap: () {
              addToCart(widget.listArticles[index]);
            },
            onFavoriteTap: () {
              favoritesTap(widget.listArticles[index]);
            },
            onTapDetailsMeth: () {
              navigateToArticleDetailPage(widget.listArticles[index]);
            },
          );
      },
    );
  }
}