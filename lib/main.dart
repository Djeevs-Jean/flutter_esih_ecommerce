import 'package:flutter/material.dart';
import 'package:bankhoo/utils/app_theme.dart';
import 'package:bankhoo/data.dart';
import 'package:bankhoo/_widget/_widget_category.dart';
import 'package:bankhoo/pages/_pages_drawer/drawer_page1.dart';
import 'package:bankhoo/models/article.dart';
import 'package:bankhoo/pages/_pages_navigation/navigation_pages1.dart';
import 'package:bankhoo/_widget/_widget_list_article.dart';


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
  const BodyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<BodyHomePageScreen> createState() => _BodyHomePageScreenState();
}

class _BodyHomePageScreenState extends State<BodyHomePageScreen> {

  List<Article> listArticles = DataApp.getListArticles();
  List<String> listCategories = DataApp.listCategories;
  List listFavorites = DataApp.listFavorites;
  List listCart = DataApp.listCart;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 500,
          padding: const EdgeInsets.only(top: 15),
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
              CategoryWidget(listCategory: listCategories)
            ],
          ),
        ),

        
      ],
    );



// SingleChildScrollView(
//       child: Container(
//       margin: const EdgeInsets.all(5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//   height: 200, // or any other value that works for your layout
//   child: ListView.builder(
//     itemCount: listCategories.length,
//     itemBuilder: ((context, index) => WidgetCategory(category: listCategories[index]))
//   ),
// ),
//             SizedBox(height: 16),
//               WidgetListProduit(listArticles: listArticles, listCart: listCart, listFavorites: listFavorites),
//           ],
//       ),
//       ),
//       );
    // );
    
    // Container(
    //     margin: const EdgeInsets.all(5),
    //     child: ListView(
    //       children: [
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //                 const Padding(padding: EdgeInsets.only(left: 10), child: Text("Top Category")),
    //               ...listCategories.map((category) => WidgetCategory(category: category)).toList(),
    //             ],
                
    //           ),
    //           // WidgetListProduit(listArticles: listArticles, listCart: listCart, listFavorites: listFavorites),

    //       ],
    //     ),
        
      
      //   child: ListView(
      //     mar
      //     children: [
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //             const Padding(padding: EdgeInsets.only(left: 10), child: Text("Top Category")),
      //           ...listCategories.map((category) => WidgetCategory(category: category)).toList(),
      //         ],)
      //     ],
      //   ),
      // // child: Column(
      // //   mainAxisAlignment: MainAxisAlignment.start,
      // //   children: [
      // //       const Padding(padding: EdgeInsets.only(left: 10), child: Text("Top Category")),
      //     ...listCategories.map((category) => WidgetCategory(category: category)).toList(),
      //   ]
      // ),
      // WidgetListProduit(listArticles: listArticles, listCart: listCart, listFavorites: listFavorites),
    // );
  }
}


// class ProductListPage extends StatefulWidget {
//   const ProductListPage({Key? key}) : super(key: key);

//   @override
//   State<ProductListPage> createState() => _ProductListPageState();
// }

// class _ProductListPageState extends State<ProductListPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Center(child: Text("List Produits"))),
//       body: const Center(child: Text("les articles a recuperer seront bientot ici"),),
//     );
//   }
// }