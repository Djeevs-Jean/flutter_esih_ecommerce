import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils.dart';
import 'package:flutter_ecommerce/pages/payment_page.dart';
import 'package:flutter_ecommerce/service/api_service.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List"),
      actions: [
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PayementPage()));
          }, child: const Text("PEYE", style: TextStyle(fontSize: 18, color: Colors.white),),)
        ],
      ),
      body: const SingleChildScrollView(
        child: ProductListWidget(getProducts: APIService.getProducts),
      ) 
    );
  }
}