import 'package:flutter/material.dart';

class WidgetCategory extends StatelessWidget {
  final String category;
  const WidgetCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Card(
        child: Center(child: Text(category)),
      ),
    );
  }
}