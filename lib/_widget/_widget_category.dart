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

  _fetchArticleByCategory(String categoryName) {
    return APIService.getProductsByCategory(categoryName);
  }

  navigateToArticleDetailPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryDetail(category: widget.category, getProducts: _fetchArticleByCategory(widget.category))));
  }

  run() {

  }


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
              onTap: (() => navigateToArticleDetailPage()),
              child: Text(widget.category, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue,  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryListWidget extends StatefulWidget {
  final Future<List> Function() getCategories;
  const CategoryListWidget({Key? key, required this.getCategories}) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late Future<List> _categories;
  late Key _key;
  

  // Future<void> _fetchArticleByCategory(String category) async {
  //   List<Article> categories = await APIService.getProductsByCategory(category);
  //   setState(() {
  //     listCategoryArticles = categories;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _categories = widget.getCategories();
    _key = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List>(
      key: _key,
      future: _categories,
      builder: (context, categoryList) {
        if (categoryList.hasData) {
          
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            children: categoryList.data!.map((item) => CategoryWidgetSingle(category: item, onTapDetail: () {

              })).toList(),
            ),  
          );
        } else if(categoryList.hasError) {
          return Center(
            child: Column(
              children: [
                Text("${categoryList.error}", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),),

                SizedBox(height: 10,),

                ElevatedButton(onPressed: () {
                  setState(() {
                    _categories = widget.getCategories();
                    _key = UniqueKey();
                  });
                }, child: Text("Retry"))
              ],
            ),
          );
        }else {
          return CircularProgressIndicator();
        }
      } 

    // widget.getCategories.isEmpty ? const Center(child: CircularProgressIndicator(),) :
    //   SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: widget.getCategories.map((category) => CategoryWidgetSingle(
    //       category: category,
    //       onTapDetail: () {
    //         _fetchArticleByCategory(category);
    //         navigateToArticleDetailPage(category, listCategoryArticles);
    //       },
    //     )).toList(),
    //   ),
    );
  }
}