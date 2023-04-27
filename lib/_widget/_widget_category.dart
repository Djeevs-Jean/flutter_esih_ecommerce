import 'package:bankhoo/models/articles.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final Article article;
  const CategoryWidget({Key? key, required this.article}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child:Card(
          child: Center(child: Text(widget.article.title),
          ),
      ),
    );
  }

}
