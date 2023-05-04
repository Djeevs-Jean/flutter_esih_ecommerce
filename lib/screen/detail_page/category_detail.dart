import 'package:bankhoo/models/article.dart';
import 'package:flutter/material.dart';
import 'package:bankhoo/screen/detail_page/product_detail.dart';
import 'package:bankhoo/services/_product_services.dart';
import 'package:bankhoo/utils/app_theme.dart';

class CategoryDetail extends StatefulWidget {
  final String category;
  final List<Article> listArticle;
  const CategoryDetail({super.key, required this.category, required this.listArticle});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {

  List<Article> _listArticles = [];
  
  void navigateToArticleDetailPage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetail(article: article)));
  }

  Future<void> _fetchArticles() async {
    final articles = await ArticleService.getArticles();
    setState(() {
      _listArticles = articles as List<Article>;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchArticles();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(widget.category, style: AppTheme.detailCategoryTitle),
          ),

          widget.listArticle.isEmpty ? const Expanded(child:Center(child: Text("No article pour cette catgory "))) :

          Expanded(child: ListView.builder(
              itemCount: widget.listArticle.length,
              itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: InkWell(
                  child: Image.network(
                    widget.listArticle[index].image,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    navigateToArticleDetailPage(widget.listArticle[index]);
                  },
                ),
                  title: Text(widget.listArticle[index].title),
                  subtitle: Text('\$${widget.listArticle[index].price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // setState(() {
                      //   if (!widget.listCart.contains(article)) {
                      //     widget.listCart.add(article);
                      //   }
                      // });
                    },
                  ),
                );
              },
              ),
          ),
        ],
      )
    );
  }
}