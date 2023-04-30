import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';
// import 'package:bankhoo/models/widget.article.dart';
// import 'package:bankhoo/_widget/_widget_widget.article.dart';
import 'package:bankhoo/pages/_details/details_page.dart';
import 'package:bankhoo/models/article.dart';

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
          return null;
          // ArticleWidget(
          //   article: widget.listArticles[index],
          //   onCartTap: () {
          //     print("images");
          //     addToCart(widget.listArticles[index]);
          //   },
          //   onFavoriteTap: () {
          //     print("favorite");
          //     favoritesTap(widget.listArticles[index]);
          //   },
          //   onTapDetailsMeth: () {
          //     print("vart");
          //     navigateToArticleDetailPage(widget.listArticles[index]);
          //   },
          // );
    });
  }
}

// class ArticleWidgetSingle extends StatefulWidget {
//   final Article article;
//   final VoidCallback onTapDetailsMeth;
//   final VoidCallback onFavoriteTap;
//   final VoidCallback onCartTap;
//   const ArticleWidgetSingle({Key? key, required this.article, required this.onTapDetailsMeth, required this.onFavoriteTap, required this.onCartTap }) : super(key: key);

//   @override
//   State<ArticleWidgetSingle> createState() => _ArticleWidgetSingle();
// }

// class _ArticleWidgetSingle extends State<ArticleWidgetSingle> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10)
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           InkWell(
//             onTap: (() => widget.onTapDetailsMeth()),
//             child: Image.network(widget.article.image, width: double.infinity, height: 120, fit: BoxFit.cover, ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(widget.article.title, style: const TextStyle( fontSize: 18, fontWeight: FontWeight.bold, ),),
//                 const SizedBox(height: 8),
//                 Text(widget.article.description, style: const TextStyle( fontSize: 16, ),),
//                 const SizedBox(height: 10),
//                 Text('Prix :${widget.article.price}\$', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold,),),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(onPressed: (() => widget.onFavoriteTap()), icon: const Icon(Icons.favorite_border)),
//                     IconButton(onPressed: (() => widget.onCartTap()), icon: const Icon(Icons.add_shopping_cart)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }


// class ArticleListWidget extends StatefulWidget {
//   final List listArticles;
//   final List listFavorites;
//   final List listCart;
//   const ArticleListWidget({Key? key, required this.listArticles, required this.listFavorites, required this.listCart}) : super(key: key);


//   @override
//   State<ArticleListWidget> createState() => _ArticleListWidgetState();
// }

// class _ArticleListWidgetState extends State<ArticleListWidget> {

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(

//       padding: const EdgeInsets.all(10),
//       childAspectRatio: 200/400,
//       // childAspectRatio: 0.45,
//       mainAxisSpacing: 8,
//       crossAxisSpacing: 10,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       children: widget.listArticles.map((article) => _ArticleWidgetSingle(article: article)).toList(),
//     );
//   }
// }