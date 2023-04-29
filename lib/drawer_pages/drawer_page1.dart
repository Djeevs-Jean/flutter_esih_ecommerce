import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/_details/details_page.dart';

class ProductsDrawerPage1 extends StatefulWidget {
  final List listArticles = DataApp.articles;
  final String imageUrl = "https://placehold.co/300x400.png";
  final String description = "l'est toujours présent dans la liste des processus du système";
  ProductsDrawerPage1({Key? key}) : super(key: key);



  @override
  State<ProductsDrawerPage1> createState() => _ProductsDrawerPage1State();
}

class _ProductsDrawerPage1State extends State<ProductsDrawerPage1> {

  void navigateToArticleDetailPage(String article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(data: article)));
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Actions")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 320
        ), 
        itemCount: widget.listArticles.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.imageUrl, fit: BoxFit.cover, width: double.infinity, height: 170,),
                Padding(padding: EdgeInsets.all(8), 
                  child: Column(
                    children: [
                      Text(widget.listArticles[index], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8),
                      Text(widget.description, style: AppTheme.desc,),
                    ]
                  ),
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
                  ],
                ),

              ],
            ),
          ),
          onTap: () {
            navigateToArticleDetailPage(widget.listArticles[index]);
          },
          );
        }),
      ),
      // count(
      // crossAxisCount: 2,
      // padding: EdgeInsets.all(16.0),
      // children: widget.listArticles.map((article) {
      //   return Card(
      //     child: SingleChildScrollView(
      //       child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Image.network(
      //           widget.imageUrl,
      //           fit: BoxFit.cover,
      //           height: 150.0,
      //         ),
      //         Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text(
      //                 article,
      //                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(height: 8.0),
      //               Text(
      //                 article,
      //                 style: TextStyle(fontSize: 14.0),
      //               ),
      //               SizedBox(height: 8.0),
      //               Text(
      //                 '\$${article}',
      //                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: <Widget>[
      //             IconButton(
      //               icon: Icon(Icons.favorite_border),
      //               onPressed: () {
      //                 // Ajouter l'article aux favoris
      //               },
      //             ),
      //             IconButton(
      //               icon: Icon(Icons.shopping_cart),
      //               onPressed: () {
      //                 // Ajouter l'article au panier
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     ),
      //   );
      // }).toList(),
    // )
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
