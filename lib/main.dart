import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/pages/_details/payement_page.dart';
import 'package:bankhoo/pages/_details/login_page.dart';
import 'package:bankhoo/_widget/_widget_category.dart';
import 'package:bankhoo/pages/_pages_drawer/drawer_page.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/_widget/_widget_article.dart';
import 'package:bankhoo/pages/_pages_navigation/navigation_pages1.dart';
import 'package:bankhoo/services/_product_services.dart';

void main() {
  runApp(const MaterialApp(home: HomePageScreen()));
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  List<Widget> listWidget = [const BodyHomePageScreen(), FavoritePage(), CartPage()];
  List<String> listWidgetTitle = ["EBootikoo", "Favorite Page", "Cart Page"];
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
              },),
              ListTile( title: const Text("List Product"), trailing: const Icon(Icons.list_alt), onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
              },),
              ListTile( title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){},),
            ],
          ),
        ),
        appBar: AppBar(
            title: Center(child: Text(listWidgetTitle.elementAt(selectedIndex))),
            actions: [TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PayementPage()));
            }, child: const Text("PEYE", style: AppTheme.titleHead,))],
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
  const BodyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<BodyHomePageScreen> createState() => _BodyHomePageScreenState();
}

class _BodyHomePageScreenState extends State<BodyHomePageScreen> {

  List<Article> _listArticles = [];
  // List<Article> listArticles = DataApp.getListArticles();
  List<String> listCategories = DataApp.listCategories;
  List listFavorites = DataApp.listFavorites;
  List listCart = DataApp.listCart;
  

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
    print("init state");
    _fetchArticles();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: const Text("Categories", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),),
              ),
              CategoryListWidget(listCategory: listCategories)
            ],
          ),
        ),
      
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Text("Articles", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue,
          ),),
        ),

        SingleChildScrollView(
          child:
        ArticleListWidget(listArticles: _listArticles, listCart: listCart, listFavorites: listFavorites),
        ),
      ],
    );
  }
}
