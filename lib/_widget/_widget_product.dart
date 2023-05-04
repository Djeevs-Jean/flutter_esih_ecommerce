import 'package:bankhoo/models/article.dart';
import 'package:flutter/material.dart';
import 'package:bankhoo/screen/detail_page/product_detail.dart';

class ProductSingleWidget extends StatefulWidget {
  final Article article;
  final VoidCallback onTapDetailsMeth;
  final VoidCallback onFavoriteTap;
  final VoidCallback onCartTap;
  const ProductSingleWidget({Key? key, required this.article, required this.onTapDetailsMeth, required this.onFavoriteTap, required this.onCartTap }) : super(key: key);

  @override
  State<ProductSingleWidget> createState() => _ProductSingleWidgetState();
}

class _ProductSingleWidgetState extends State<ProductSingleWidget> {

   @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (() => widget.onTapDetailsMeth()),
            child: Image.network(
              widget.article.image,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.article.title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.article.description,
                  // UtilsWord.subsWord(widget.article.description),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  'Prix :${widget.article.price}\$',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (() => widget.onFavoriteTap()),
                      icon: const Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: (() => widget.onCartTap()),
                      icon: const Icon(Icons.add_shopping_cart),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// liste produits

class ProductListWidget extends StatefulWidget {
  final List<Article> listArticles;
  final List<dynamic> listFavorites;
  final List<dynamic> listCart;
  const ProductListWidget({Key? key, required this.listArticles, required this.listFavorites, required this.listCart}) : super(key: key);

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {

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
    return widget.listArticles.isEmpty ? const Center(child: CircularProgressIndicator(),) :
    GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      itemCount: widget.listArticles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
        childAspectRatio: 0.45,
        // childAspectRatio: 200/450,
      ),
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
      return ProductSingleWidget(
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