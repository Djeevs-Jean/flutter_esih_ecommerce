import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/service/api_service.dart';
import 'package:flutter_ecommerce/data_program.dart';
import 'package:flutter_ecommerce/models/article.dart';
import 'package:flutter_ecommerce/services/_product_services.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  List<Article> _listArticles = [];
  List listFavorites = DataProgram.listFavorites;
  List listCart = DataProgram.listCart;

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
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: const ProductListWidget(getProducts: APIService.getProducts),
      ),
    );
  }
}