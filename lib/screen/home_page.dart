import 'package:flutter/material.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/services/_product_services.dart';
import 'package:bankhoo/services/_category_services.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/_widget/_widget_product.dart';
import 'package:bankhoo/_widget/_widget_category.dart';
import 'package:bankhoo/data_program.dart';

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
    final articles = await ArticleService.getArticles();
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
    return ListView(
      children: [
        Container( padding: const EdgeInsets.only(top: 10), decoration: const BoxDecoration(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
                child: const Text("Categories", style: AppTheme.categoryTop),
              ),
              CategoryListWidget(listCategory: listCategories),
            ],
          ),
        ),
      
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: const Text("Articles", style: AppTheme.categoryTop),
        ), 

        SingleChildScrollView(
          child:ProductListWidget(
            listArticles: _listArticles, 
            listCart: listCart, listFavorites: listFavorites),
        ),
      ],
    );
  }
}
