import 'package:bankhoo/models/article.dart';
import 'package:flutter/material.dart';
import 'package:bankhoo/pages/_details/details_product.dart';
import 'package:bankhoo/utils/app_theme.dart';
class DetailCategory extends StatefulWidget {
  final String category;
  final List<Article> listArticle;
  const DetailCategory({super.key, required this.category, required this.listArticle});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  
  void navigateToArticleDetailPage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailProduct(article: article)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(widget.category, style: AppTheme.detailCategoryTitle),
          ),

          widget.listArticle.isEmpty ? const Expanded(child:Center(child: Text("No article pour cette catgory "))) :

          Expanded(child: ListView.builder(
              itemCount: widget.listArticle.length,
              itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: InkWell(
                  child: Image.network(
                    widget.listArticle[index].image,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    navigateToArticleDetailPage(widget.listArticle[index]);
                  },
                ),
                  title: Text(widget.listArticle[index].title),
                  subtitle: Text('\$${widget.listArticle[index].price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // setState(() {
                      //   if (!widget.listCart.contains(article)) {
                      //     widget.listCart.add(article);
                      //   }
                      // });
                    },
                  ),
                );
              },
              ),
          ),
        ],
      )
    );
  }
}