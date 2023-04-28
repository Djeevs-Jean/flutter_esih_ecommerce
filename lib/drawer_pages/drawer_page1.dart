import 'package:flutter/material.dart';
import 'package:bankhoo/app_theme.dart';

class DrawerPage1 extends StatefulWidget {
  const DrawerPage1({Key? key}) : super(key: key);


  @override
  State<DrawerPage1> createState() => _DrawerPage1State();
}

class _DrawerPage1State extends State<DrawerPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Actions")),
      body: Center(child: Text("DrawerPage 1 DrawerPage1")),
      
    );
  }
}

class DrawerPage2 extends StatefulWidget {
  const DrawerPage2({Key? key}) : super(key: key);

  @override
  State<DrawerPage2> createState() => _DrawerPage2State();
}

class _DrawerPage2State extends State<DrawerPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("List Produits")),
          actions: [TextButton(onPressed: () {print("peye");}, child: const Text("PEYE", style: AppTheme.titleHead,))],
        ),
      body: Center(child: Text("DrawerPage 2 DrawerPage2")),
    );
  }
}
