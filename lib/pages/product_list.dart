import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  // final List<Article> productList;
  // final List<String> productList;
  // const ProductListPage({Key? key, required this.productList}) : super(key: key);
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Welcome to my app!'),
      ),
      );

    // return Scaffold(
    //   appBar: AppBar(title: Text("List Product"),),
    // );
  }

}