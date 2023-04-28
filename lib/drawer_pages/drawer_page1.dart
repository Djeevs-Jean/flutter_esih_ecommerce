import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';

class ProductsDrawerPage1 extends StatefulWidget {
  final List listArticles = DataApp.articles;
  final String imageUrl = "https://placehold.co/300x400.png";
  ProductsDrawerPage1({Key? key}) : super(key: key);


  @override
  State<ProductsDrawerPage1> createState() => _ProductsDrawerPage1State();
}

class _ProductsDrawerPage1State extends State<ProductsDrawerPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actions")),
      body:GridView.count(
          crossAxisCount: 2, // 2 elements par colonnes,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ...widget.listArticles.map((article) => Card(
              child: Column(children: [
                Image.network(widget.imageUrl, width: 156, height: 156,),
                Center(child: Text(article)),

              ],)
            )).toList()
          ],
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
