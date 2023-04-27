import 'package:bankhoo/models/articles.dart';
import 'package:bankhoo/_widget/_widget_articles.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  final List<Article> productList;
  const ProductListPage({Key? key, required this.productList}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: [...widget.productList.map((article) => ArticleWidget(article: article)).toList()],
    );
  }

}