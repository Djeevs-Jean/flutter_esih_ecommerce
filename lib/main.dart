import 'package:flutter/material.dart';
import 'package:bankhoo/wish.dart';
import 'package:bankhoo/theme.dart';
import 'package:bankhoo/services/api_service.dart';
import 'package:bankhoo/models/articles.dart';
import 'package:bankhoo/_widget/_widget_articles.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> listWidget = const [BodyMainScreen(), WishScreen() ];
  List<String> listTitle = const ["EBoutikoo", "Wish" ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
              ListTile( title: const Text("Connecter"), trailing: const Icon(Icons.login), onTap: (){},),
              ListTile( title: const Text("List Product"), trailing: const Icon(Icons.list_alt), onTap: (){},),
              ListTile( title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){},),
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(child: Text(listTitle.elementAt(selectedIndex))),
          actions: [TextButton(onPressed: () {print("peye");}, child: const Text("PEYE", style: AppTheme.titleHead,))],
        ),
        body:
           Container(
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: listWidget.elementAt(selectedIndex),
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Update Text'),
            BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'Table'),  
          ],
          
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}

class BodyMainScreen extends StatefulWidget {
  const BodyMainScreen({Key? key}) : super(key: key);

  @override
  State<BodyMainScreen> createState() => _BodyMainScreenState();
}

class _BodyMainScreenState extends State<BodyMainScreen> {

  APIServices apiServices = APIServices();
  List<Article> listArticles = [];
  bool _isLoading = true;
  
  getArticles() async{
    String urlEndpoint = "https://jsonplaceholder.typicode.com/posts?_limit=10";
    // String urlEndpoint = "https://fakestoreapi.com/products";
    try {
      var articles = await apiServices.get(urlEndpoint);
      setState(() {
        listArticles = articles;
        print(listArticles);
        _isLoading = false;
      });
    // ignore: empty_catches
    } catch (e) {
      
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticles();
  }


  final List<String> categories = ['Catégorie 1', 'Catégorie 2', 'Catégorie 3'];
  final List<String> articles = ['Article 1', 'Article 2', 'Article 3', 'Article 4', 'Article 5', 'Article 6', 'Article 7', 'Article 8', 'Article 1', 'Article 2', 'Article 3', 'Article 4', 'Article 5', 'Article 6', 'Article 7', 'Article 8', 'Article 1', 'Article 2', 'Article 3', 'Article 4', 'Article 5', 'Article 6', 'Article 7', 'Article 8'];


  @override
  Widget build(BuildContext context) {
    // return _isLoading ? const Center(child: CircularProgressIndicator()) :
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...categories.map((category) => Container(
          height: 120,
          child: Card(
            child: Center(child: Text(category)),

          ),
        )).toList(),
        
        GridView.count(
          crossAxisCount: 2, // 2 elements par colonnes,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ...articles.map((article) => Container(
              child: Card(
                child: Center(child: Text(article)),
              ),
            )).toList()
          ],
        ),
      ],
    );

    
    // Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       // Affichage des catégories
    //       ...categories.map((category) => Container(height: 120, child: Card(
    //         child: Center(
    //           child: Text(category),
    //         ),
    //       ))).toList(),

    //       // Affichage des articles
    //       GridView.count(
    //         crossAxisCount: 2, // 2 éléments par ligne
    //         shrinkWrap: true,
    //         physics: NeverScrollableScrollPhysics(),
    //         children: [
    //           ...articles.map((article) => Card(
    //             child: Center(
    //               child: Text(article),
    //             ),
    //           )).toList(),
    //         ],
    //       ),
    //     ],
    //   );
    
    // GridView.count(
    //     crossAxisCount: 2, // 2 éléments par ligne
    //     children: [
    //       // Affichage des catégories
    //       Column(

    //         children: [
    //           ...categories.map((category) => Card(
    //         child: Center(
    //           child: Text(category),
    //         ),
    //       )).toList(),
    //         ],
    //       )

    //       // Affichage des articles
    //       ...articles.map((article) => Card(
    //         child: Center(
    //           child: Text(article),
    //         ),
    //       )).toList(),
    //     ],
    //   );


        // // Column(
        // //   children: [
        // //     const Text('Grille 1'),
        //     GridView.count(
        //       shrinkWrap: true,
        //       crossAxisCount: 2,
        //       children: const [
        //         GridTile(
        //           child: Text('Données 1a'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1b'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1c'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1d'),
        //         ),
        //          GridTile(
        //           child: Text('Données 1a'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1b'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1c'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1d'),
        //         ),
        //          GridTile(
        //           child: Text('Données 1a'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1b'),
        //         ),
        //         GridTile(
        //           child: Text('Données 1c'),
        //         ),
        //         GridTile(
        //           child: Text('Données 22'),
        //         )
        //       ],
        //     );
            

        // // Column(
        // //     children: [
        // //     Container(
        //       //  GridView.count(
        //       // crossAxisCount: 2,
        //       // children: listArticles.map((ite) => ArticleWidget(article: ite)).toList(),
        //     // ),
        //   //   )
        //   // ],
        // );

        // margin: const EdgeInsets.all(10),
        // child: Column(
        //   children:  [
        //     Text("Data"),
        //     Container(
        //       child: GridView.count(
        //       crossAxisCount: 2,
        //       // mainAxisSpacing: 22,
        //       // crossAxisSpacing: 22,
        //       children: listArticles.map((ite) => ArticleWidget(article: ite)).toList(),
        //     ),
        //     ),
        //   ],
        // )
    // )
  }
}
