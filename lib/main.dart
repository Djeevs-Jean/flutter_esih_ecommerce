import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/app_theme.dart';
import 'package:flutter_ecommerce/notifier_chg.dart';
import 'package:flutter_ecommerce/screen/home_page.dart';
import 'package:flutter_ecommerce/screen/auth_page/login_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/screen/payment_page.dart';
import 'package:flutter_ecommerce/screen/drawer_page/productlist_page.dart';
import 'package:flutter_ecommerce/screen/cart_page.dart';
import 'package:flutter_ecommerce/screen/favorite_page.dart';
import 'package:flutter_ecommerce/local/user_preference.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => MyAppStateNotifier(),
      child: MaterialApp(
      title: 'Flutter E-commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen()
      )
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> listWidget = const[ FavoritePage(), HomePageScreen(), CartPage()];
  List<String> listWidgetTitle = ["Favorite Page", "EBootikoo", "Cart Page"];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
  MyAppStateNotifier state = context.watch<MyAppStateNotifier>();

  return Scaffold(
    drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Center(child: Text("ECommerce", style: AppTheme.titleDrawer,)),
                Center(child: state.isLogin() ? Text("Username: ", style: AppTheme.titleDrawer,) : Text("Username: ${state.getUser()["username"]}", style: AppTheme.titleDrawer,)),
                SizedBox(height: 20, child: Icon(Icons.eco_outlined, size: 70,),),
              ],
            ),
          ),
          ListTile(title: const Text("Connecter"), trailing: const Icon(Icons.login), onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
          },),
          ListTile(title: const Text("List Product"), trailing: const Icon(Icons.list_alt), onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListPage()));
          },),
          ListTile(title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){
            UserPreferences.logout();
            print("deconnecter");
          },),
        ],
      ),
    ),
    appBar: AppBar(
        title: Center(child: Text(listWidgetTitle.elementAt(selectedIndex))),
        actions: [
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PayementPage()));
          }, child: const Text("PEYE", style: AppTheme.titleHead,))
        ],
      ),
    body: listWidget.elementAt(selectedIndex),
    bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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
