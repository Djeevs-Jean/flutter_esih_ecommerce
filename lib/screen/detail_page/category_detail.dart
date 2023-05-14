import 'package:flutter_ecommerce/models/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/detail_page/product_detail.dart';
import 'package:flutter_ecommerce/services/_product_services.dart';
import 'package:flutter_ecommerce/utils/app_theme.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';
import 'package:flutter_ecommerce/service/api_service.dart';

class CategoryDetail extends StatefulWidget {
  final String category;
  final Future<List<Article>> Function() getProducts;
  const CategoryDetail({super.key, required this.category, required this.getProducts});

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
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(widget.category, style: AppTheme.detailCategoryTitle),
          ),

          ProductListWidget(getProducts: widget.getProducts),
         
        ],
      )
      ),
      /*  

          widget.getProducts.isEmpty ? const Expanded(child:Center(child: Text("No article pour cette catgory "))) :

          Expanded(child: ListView.builder(
              itemCount: widget.getProducts.length,
              itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: InkWell(
                  child: Image.network(
                    widget.getProducts[index].image,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    navigateToArticleDetailPage(widget.getProducts[index]);
                  },
                ),
                  title: Text(widget.getProducts[index].title),
                  subtitle: Text('\$${widget.getProducts[index].price}'),
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
              ), */
    );
  }
}