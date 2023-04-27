import 'package:bankhoo/models/articles.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatefulWidget {
  final Article article;
  const ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(child: Text(widget.article.title),),
    );
  }

}
