import 'package:flutter_ecommerce/models/article.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce/pages/_details/details_category.dart';
import 'package:flutter_ecommerce/screen/detail_page/category_detail.dart';
// import 'package:flutter_ecommerce/services/_category_services.dart';
import 'package:flutter_ecommerce/service/api_service.dart';

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
              child: Text(widget.category, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue,  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryListWidget extends StatefulWidget {
  final List<String> listCategory;
  const CategoryListWidget({Key? key, required this.listCategory}) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  List<Article> listCategoryArticles = [];

  Future<void> _fetchArticleByCategory(String category) async {
    List<Article> categories = await APIService.getProductsByCategory(category);
    setState(() {
      listCategoryArticles = categories;
    });
  }

  void navigateToArticleDetailPage(String category, List<Article> listArticle) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryDetail(category: category, listArticle: listArticle)));
  }

  @override
  Widget build(BuildContext context) {
    return widget.listCategory.isEmpty ? const Center(child: CircularProgressIndicator(),) :
      SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.listCategory.map((category) => CategoryWidgetSingle(
          category: category,
          onTapDetail: () {
            _fetchArticleByCategory(category);
            navigateToArticleDetailPage(category, listCategoryArticles);
          },
        )).toList(),
      ),
    );
  }
}