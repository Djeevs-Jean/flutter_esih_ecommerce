import 'package:flutter/material.dart';
import 'package:bankhoo/models/article.dart';

class DetailProduct extends StatefulWidget {
  final Article article;
  const DetailProduct({super.key, required this.article});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
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