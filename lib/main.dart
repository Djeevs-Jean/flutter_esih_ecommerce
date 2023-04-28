import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/drawer_pages/drawer_page1.dart';
import 'package:bankhoo/navigation_pages/navigation_pages1.dart';
void main() {
  runApp(const MaterialApp(home: HomePageScreen()));
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  List<Widget> listWidget = [BodyHomePageScreen(), NavigationPage1(), NavigationPage2()];
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                child: Column(
                  children: const[
                    Center(child: Text("ECommerce", style: AppTheme.titleDrawerHead,)),
                    SizedBox(
                      height: 20,
                      child: Icon(Icons.eco_outlined, size: 70,),
                    ),
                  ],
                ),
              ),
              
              ListTile( title: const Text("Connecter"), trailing: const Icon(Icons.login), onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DrawerPage2()));
              },),
              ListTile( title: const Text("List Product"), trailing: const Icon(Icons.list_alt), onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsDrawerPage1()));
              },),
              ListTile( title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){},),
            ],
          ),
        ),
        appBar: AppBar(
            title: const Center(child: Text("EBootikoo")),
            actions: [TextButton(onPressed: () {print("peye");}, child: const Text("PEYE", style: AppTheme.titleHead,))],
          ),
        body: SingleChildScrollView(
            child: listWidget.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.sell_outlined), label: "Panier"),
            ],
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            currentIndex: selectedIndex,
          ),
    );
  }
}

class BodyHomePageScreen extends StatefulWidget {
  BodyHomePageScreen({Key? key}) : super(key: key);

  final List listArticles = DataApp.articles;
  final List listCategories = DataApp.categories;
  final String imageUrl = "https://placehold.co/300x400.png";


  @override
  State<BodyHomePageScreen> createState() => _BodyHomePageScreenState();
}

class _BodyHomePageScreenState extends State<BodyHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 18,),
        const Padding( padding: EdgeInsets.only(left: 22),  child: Text("Top Category", style: AppTheme.titleTopcategorie,),),
        ...widget.listCategories.map((category) => Container(
          height: 120,
          child: Card(
            child: Center(child: Text(category)),

          ),
        )).toList(),
        
        const SizedBox(height: 18,),
        const Padding( padding: EdgeInsets.only(left: 22),  child: Text("Top Produits", style: AppTheme.titleTopcategorie,),),
        
        GridView.count(
          crossAxisCount: 2, // 2 elements par colonnes,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ...widget.listArticles.map((article) => Card(
              child: Center(child: Text(article)),
            )).toList()
          ],
        ),
      ],
    );
  }
}