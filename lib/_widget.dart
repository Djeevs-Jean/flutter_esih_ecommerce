import 'package:flutter/material.dart';
import 'package:bankhoo/article.dart';
import 'package:bankhoo/utils/app_theme.dart';

class ListCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTapDetailsMeth;
  final VoidCallback onFavoriteTap;
  final VoidCallback onCartTap;

  const ListCard({Key? key, required this.article, required this.onTapDetailsMeth, required this.onFavoriteTap, required this.onCartTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (() => onTapDetailsMeth()),
            child: Image.network(article.image, fit: BoxFit.cover, width: double.infinity, height: 170,),
          ),
          Padding(padding: const EdgeInsets.all(8), 
            child: Column(
              children: [
                Text(article.image, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 8),
                Text(article.description, style: AppTheme.desc,),
              ]
            ),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (() => onFavoriteTap()), icon: const Icon(Icons.favorite)),
              IconButton(onPressed: (() => onCartTap()), icon: const Icon(Icons.shopping_cart)),
            ],
          ),
        ],
      ),
    );
  }
}