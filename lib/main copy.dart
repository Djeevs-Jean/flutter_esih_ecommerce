import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils.dart';
import 'package:flutter_ecommerce/pages/home_page.dart';
import 'package:flutter_ecommerce/pages/auth_page/login_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/pages/payment_page.dart';
import 'package:flutter_ecommerce/pages/drawer_page/productlist_page.dart';
import 'package:flutter_ecommerce/pages/cart_page.dart';
import 'package:flutter_ecommerce/pages/favorite_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => StateNotifier(),
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
  List<String> listWidgetTitle = ["Cart Page", "FedCommerce", "Favorite Page"];
  int selectedIndex = 1;
  late Key _key;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _key = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
  StateNotifier state = context.watch<StateNotifier>();

  return Scaffold(
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              // Handle drawer item click
            },
          ),
          ListTile(
            leading: const Icon(Icons.select_all_outlined),
            title: const Text('Product List'),
            onTap: () {
              // Handle drawer item click
            },
          ),
          ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'),onTap: () {
            state.logout();
            setState(() {
              _key = UniqueKey();
              });
            },
            enabled: !state.isLogin(),
          ),
        ],
      ),
    ),
    
    appBar: AppBar(
        title: Center(child: Text(listWidgetTitle.elementAt(selectedIndex))),
        actions: [
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PayementPage()));
          }, child: const Text("PEYE", style: UtilsTheme.titleHead, ))
        ],
      ),
    body: listWidget.elementAt(selectedIndex),
    bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
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


/* Drawer(
  child: ListView(
    children: [
      DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            const Center(child: Text("ECommerce", style: UtilsTheme.titleDrawer,)),
            Center(child: state.isLogin() ? Text("Username: ${state.getUser()["username"]}") : Text("Username: ${state.getUser()["id"]}", style: UtilsTheme.titleDrawer,)),
            const SizedBox(height: 20, child: Icon(Icons.eco_outlined, size: 70,),),
          ],
        ),
      ),
      ListTile(title: const Text("Connecter"), trailing: const Icon(Icons.login), onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
      },
        enabled: !state.isLogin(),
      ),
      ListTile(title: const Text("List Product"), trailing: const Icon(Icons.list_alt), onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListPage()));
      },),
      ListTile(title: const Text("Deconnecter"), trailing: const Icon(Icons.logout), onTap: (){
        state.logout();
        setState(() {
          _key = UniqueKey();
        });
        //rafrechi paj la
        print("deconnecter");
      },
      enabled: state.isLogin(),),
    ],
  ),
), */