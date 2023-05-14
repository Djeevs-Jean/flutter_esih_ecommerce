import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/article.dart';
import 'package:flutter_ecommerce/services/_product_services.dart';
import 'package:flutter_ecommerce/service/api_service.dart';
import 'package:flutter_ecommerce/services/_category_services.dart';
import 'package:flutter_ecommerce/utils/app_theme.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';
import 'package:flutter_ecommerce/_widget/_widget_category.dart';
import 'package:flutter_ecommerce/data_program.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  List<Article> _listArticles = [];
  List<String> listCategories = [];
  List listFavorites = DataProgram.listFavorites;
  List listCart = DataProgram.listCart;
  

  Future<void> _fetchArticles() async {
    final articles = await APIService.getTopProducts();
    // final articles = await ArticleService.getArticles();
    setState(() {
      _listArticles = articles as List<Article>;
    });
  }

  Future<void> _fetchCategory() async {
    final categories = await CategoryService.getCategories();

    print("load category");
    setState(() {
      listCategories = categories;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _fetchArticles();
    _fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
            child: const Text("Categories", style: AppTheme.categoryTop),
          ),
          const CategoryListWidget(getCategories: APIService.getTopCategories),

          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: const Text("Articles", style: AppTheme.categoryTop),
          ), 
          const ProductListWidget(getProducts: APIService.getTopProducts),
        ],
      )
    );
    
  }
}
