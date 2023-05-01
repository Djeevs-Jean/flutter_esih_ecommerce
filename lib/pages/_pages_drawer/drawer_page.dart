import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/services/_product_services.dart';
import 'package:bankhoo/_widget/_widget_article.dart';


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
        margin: const EdgeInsets.all(10),
        child: ArticleListWidget(listArticles: _listArticles, listCart: listCart, listFavorites: listFavorites),
      ),
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
