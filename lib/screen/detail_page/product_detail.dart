import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/article.dart';

class ProductDetail extends StatelessWidget {
  final Article article;
  const ProductDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.image, fit: BoxFit.cover, width: double.infinity, height: 200,),
            Padding(padding: EdgeInsets.all(12), 
              child: Column(children: [
                const SizedBox(height: 16,),
                Text("Article ${article.category}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                Text(article.description, style: const TextStyle(fontSize: 22, ),),    
                const SizedBox(height: 16,),
                Text('Price: ${article.price}\$', style: const TextStyle(fontSize: 22, ),),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}