import 'package:bankhoo/models/article.dart';
import 'package:flutter/material.dart';

class DetailCategory extends StatefulWidget {
  final String category;
  final List<Article> listArticle;

  const DetailCategory({super.key, required this.category, required this.listArticle});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Image.network(widget.imageUrl, fit: BoxFit.cover, width: double.infinity, height: 200,),
            // Padding(padding: EdgeInsets.all(12), 
            //   child: Column(children: [
            //     const SizedBox(height: 16,),
            //     Text("Article ${widget.category}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            //     const SizedBox(height: 16,),
            //     Text(widget.category.description, style: const TextStyle(fontSize: 22, ),),
            //   ]),
            // ),
          ],

           
        ),
      ),
    );
  }
}