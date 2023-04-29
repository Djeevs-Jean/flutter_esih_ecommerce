import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String data;
  const DetailPage({super.key, required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Detail")),
      body: Center(child: Text(widget.data)),
    );
  }
}
