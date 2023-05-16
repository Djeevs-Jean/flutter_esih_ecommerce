import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/payment_page.dart';
import 'package:flutter_ecommerce/utils.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';
import 'package:flutter_ecommerce/service/api_service.dart';

class CategoryDetail extends StatelessWidget {
  final String category;
  const CategoryDetail({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category),
      actions: [
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PayementPage()));
          }, child: const Text("PEYE", style: UtilsTheme.titleHead, ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(category, style: UtilsTheme.detailCategoryTitle),
          ),
          ProductListWidget(getProducts: () {
            return APIService.getProductsByCategory(category);
          }),
        ],
        )
      ),
    );
  }
}