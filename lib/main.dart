import 'package:flutter/material.dart';
import 'package:bankhoo/wish.dart';
import 'package:bankhoo/theme.dart';
import 'package:bankhoo/services/api_service.dart';
import 'package:bankhoo/data/data.dart';
import 'package:bankhoo/pages/product_list.dart';

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
      // routes: {
      //   '/productList':(context) => ProductListPage(),
      // },
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
              ListTile( title: const Text("Connecter"), trailing: const Icon(Icons.login), onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage(productList: Data.articles,)));
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
              },),
              ListTile( title: const Text("List Product"), trailing: const Icon(Icons.list_alt), onTap: (){},),
              ListTile( title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){},),
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(child: Text(listTitle.elementAt(selectedIndex))),
          actions: [TextButton(onPressed: () {print("peye");}, child: const Text("PEYE", style: AppTheme.titleHead,))],
        ),
        body: Container(
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
  List<String> listArticles = Data.articles;
  List<String> listCategories = Data.categories;
  bool _isLoading = false;
  
  /* getArticles() async{
    // String urlEndpoint = "https://jsonplaceholder.typicode.com/posts?_limit=10";
    String urlEndpoint = "https://fakestoreapi.com/products?limit=8";
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
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? const Center(child: CircularProgressIndicator()) :
      Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...listCategories.map((category) => Container(
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
            ...listArticles.map((article) => Card(
              child: Center(child: Text(article),),
            )).toList()
          ],
        ),
      ],
    );
  }
}
