import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/services/_product_services.dart';
import 'package:bankhoo/_widget/_widget_product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  List<Article> _listArticles = [];
  List listFavorites = DataApp.listFavorites;
  List listCart = DataApp.listCart;

  Future<void> _fetchArticles() async {
    final articles = await ArticleService.getArticles();
    setState(() {
      _listArticles = articles as List<Article>;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("List Produits"))),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
        child: ProductListWidget(listArticles: _listArticles, listCart: listCart, listFavorites: listFavorites),
      ),
    );
  }
}