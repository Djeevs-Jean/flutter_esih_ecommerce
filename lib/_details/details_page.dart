import 'package:flutter/material.dart';
import 'package:bankhoo/models/article.dart';

class DetailPage extends StatefulWidget {
  final Article article;
  final String imageUrl = "https://placehold.co/300x400.png";
  const DetailPage({super.key, required this.article});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.imageUrl, fit: BoxFit.cover, width: double.infinity, height: 200,),
            Padding(padding: EdgeInsets.all(12), 
              child: Column(children: [
                const SizedBox(height: 16,),
                Text("Article ${widget.article}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                Text(widget.article.description, style: const TextStyle(fontSize: 22, ),),
              ]),
            ),
          ],

           
        ),
      ),
    );
  }
}