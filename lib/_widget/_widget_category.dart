import 'package:bankhoo/models/article.dart';
import 'package:flutter/material.dart';
import 'package:bankhoo/pages/_details/details_category.dart';

class CategoryWidgetSingle extends StatefulWidget {
 final String category;
  final VoidCallback onTapDetail;
  const CategoryWidgetSingle({Key? key, required this.category, required this.onTapDetail}) : super(key: key);

  @override
  State<CategoryWidgetSingle> createState() => _CategoryWidgetSingle();
}

class _CategoryWidgetSingle extends State<CategoryWidgetSingle> {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40, width: 40, child: Icon(Icons.call_to_action)),
            InkWell(
              onTap: (() => widget.onTapDetail()),
              child: 
              Text(widget.category, style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,  
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryListWidget extends StatefulWidget {
  final List<String> listCategory;
  const CategoryListWidget({Key? key, required this.listCategory});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  final List<Article> listArticle_tries = [];

  void navigateToArticleDetailPage(String category, List<Article> listArticle) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailCategory(category: category, listArticle: listArticle)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.listCategory.map((category) => CategoryWidgetSingle(
          category: category,
          onTapDetail: () {
            navigateToArticleDetailPage(category, listArticle_tries);
          },
        )).toList(),
      ),
    );
  }
}