import 'package:flutter/material.dart';

class _CategoryWidgetSingle extends StatelessWidget {
  final String category;
  const _CategoryWidgetSingle({Key? key, required this.category}) : super(key: key);

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
            Text(category, style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.blue,  
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final List<String> listCategory;
  const CategoryWidget({Key? key, required this.listCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listCategory.map((category) => _CategoryWidgetSingle(category: category)).toList(),
      ),
    );
  }
}