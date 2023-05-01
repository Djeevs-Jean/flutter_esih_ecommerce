import 'package:bankhoo/models/article.dart';
import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
class DetailCategory extends StatefulWidget {
  final String category;
  final List<Article> listArticle;
  const DetailCategory({super.key, required this.category, required this.listArticle});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
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
                leading: Image.network(
                    widget.listArticle[index].image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(widget.listArticle[index].title),
                  subtitle: Text('\$${widget.listArticle[index].price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Ajouter le produit au panier ici
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