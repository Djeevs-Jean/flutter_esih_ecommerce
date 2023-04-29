import 'package:flutter/material.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/drawer_pages/drawer_page1.dart';
import 'package:bankhoo/navigation_pages/navigation_pages1.dart';
import 'package:bankhoo/_details/details_page.dart';

void main() {
  runApp(const MaterialApp(home: HomePageScreen()));
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  List<Widget> listWidget = [BodyHomePageScreen(), NavigationFavorites(), CartsPage2()];
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
        body:  listWidget.elementAt(selectedIndex),
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
  final String description = "l'est toujours présent dans la liste des processus du système";
  BodyHomePageScreen({Key? key}) : super(key: key);


  // final List listArticles = DataApp.articles;
  // final List listCategories = DataApp.categories;
  final String imageUrl = "https://placehold.co/300x400.png";

  @override
  State<BodyHomePageScreen> createState() => _BodyHomePageScreenState();
}

class _BodyHomePageScreenState extends State<BodyHomePageScreen> {

  void navigateToArticleDetailPage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(article: article)));
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return const Center(child: Text("HomePage"),);
  }
}