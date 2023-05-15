import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/service/api_service.dart';
import 'package:flutter_ecommerce/utils.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';
import 'package:flutter_ecommerce/_widget/_widget_category.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
            child: const Text("Top Categories", style: UtilsTheme.categoryTop),
          ),
          const CategoryListWidget(getCategories: APIService.getTopCategories),

          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: const Text("Top Products", style: UtilsTheme.categoryTop),
          ), 
          const ProductListWidget(getProducts: APIService.getTopProducts),
        ],
      )
    );
  }
}
