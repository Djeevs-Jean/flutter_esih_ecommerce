import 'package:flutter/material.dart';
import 'package:bankhoo/wish.dart';
import 'package:bankhoo/theme.dart';
import 'package:bankhoo/services/api_service.dart';
import 'package:bankhoo/models/articles.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> listWidget = const [BodyMainScreen(), WishScreen() ];
  List<String> listTitle = const ["BankHOO", "Wish" ];
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
              ListTile( title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){},),
            ],
          ),
        ),
        // appBar
        appBar: AppBar(
          title: Center(child: Text(listTitle.elementAt(selectedIndex))),
        ),
        // body
        body: SingleChildScrollView(
          child: listWidget.elementAt(selectedIndex),
        ),
        // bottomNavigationBar
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

  @override
  void initState() {
    super.initState();
    _initArticle();
  }

  _initArticle() async{
    String urlEndpoit = "https://jsonplaceholder.typicode.com/posts?_limit=10";
    try {
      final articles = await apiServices.get(urlEndpoit);
      setState(() {
        listArticles = articles;
      });
    } catch (e) {
      print(e);    
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        Text("List Article $listArticles"),
      ]),
    );
  }

}

