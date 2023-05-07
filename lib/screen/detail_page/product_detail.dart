import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/article.dart';

class ProductDetail extends StatefulWidget {
  final Article article;
  const ProductDetail({super.key, required this.article});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.article.image, fit: BoxFit.cover, width: double.infinity, height: 200,),
            Padding(padding: EdgeInsets.all(12), 
              child: Column(children: [
                const SizedBox(height: 16,),
                Text("Article ${widget.article}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                Text(widget.article.description, style: const TextStyle(fontSize: 22, ),),    
                const SizedBox(height: 16,),
                Text('Price: ${widget.article.price}\$', style: const TextStyle(fontSize: 22, ),),
              ]),
            ),
          ],

           
        ),
      ),
    );
  }
}