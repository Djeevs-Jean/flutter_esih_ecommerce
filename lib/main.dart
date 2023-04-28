import 'package:flutter/material.dart';
import 'package:bankhoo/theme.dart';
import 'package:bankhoo/drawer_pages/page_1.dart';
import 'package:bankhoo/data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  var tltle = "EBoutikoo";
  var data = Data.articles;

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
                    Center(child: Text("ECommerce")),
                    SizedBox(
                      height: 20,
                      child: Icon(Icons.eco_outlined, size: 70,),
                    ),
                  ],
                ),
              ),

              ListTile( title: const Text("Connecter"), trailing: const Icon(Icons.login), onTap: (){
              },),
              ListTile( title: const Text("List Product"), trailing: const Icon(Icons.list_alt), onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1(listArticles: data,)));
              },),
              ListTile( title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){},),
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(child: Text(tltle)),
          actions: [TextButton(onPressed: () {print("peye");}, child: const Text("PEYE", style: AppTheme.titleHead,))],
        ),
        body: const Center(child: Text("Center"),),
    );
  }
}

