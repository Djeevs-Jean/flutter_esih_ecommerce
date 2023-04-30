import 'package:flutter/material.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/_widget/_widget_article.dart';
import 'package:bankhoo/_widget/_widget_category.dart';
import 'package:bankhoo/pages/_pages_drawer/drawer_page1.dart';
import 'package:bankhoo/pages/_pages_navigation/navigation_pages1.dart';
import 'package:bankhoo/pages/_details/details_page.dart';

void main() {
  runApp(const MaterialApp(home: HomePageScreen()));
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  List<Widget> listWidget = [BodyHomePageScreen(), FavoritePage(), CartPage()];
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
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
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Panier"),
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
  final List listCategories = DataApp.listCategories;
  final List listArticles = DataApp.getListArticles();
  List listFavorites = DataApp.listFavorites;
  List listCart = DataApp.listCart;

  BodyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<BodyHomePageScreen> createState() => _BodyHomePageScreenState();
}

class _BodyHomePageScreenState extends State<BodyHomePageScreen> {

  void navigateToArticleDetailPage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(article: article)));
  }

  void favoritesTap(Article article) {
      setState(() {
        print(article);
        if (!widget.listFavorites.contains(article)) {
          widget.listFavorites.add(article);
        }
      });
    }

  void addToCart(Article article) {
      setState(() {
        print(article);
        if (!widget.listCart.contains(article)) {
          widget.listCart.add(article);
        }
      });
    }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(left: 10), child: Text("Top Category")),
          ...widget.listCategories.map((category) => WidgetCategory(category: category)).toList(),
          
        ]
      ),
    );
  }
}