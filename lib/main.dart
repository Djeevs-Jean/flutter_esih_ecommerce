import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils.dart';
import 'package:flutter_ecommerce/screen/home_page.dart';
import 'package:flutter_ecommerce/screen/auth_page/login_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/screen/payment_page.dart';
import 'package:flutter_ecommerce/screen/drawer_page/productlist_page.dart';
import 'package:flutter_ecommerce/screen/cart_page.dart';
import 'package:flutter_ecommerce/screen/favorite_page.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
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
  List<Widget> listWidget = const[ CartPage(), HomePageScreen(), FavoritePage(),];
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
            accountName: state.isLogin() ? Text(state.getUser()['username']) : const Text("No User Connected"),
            currentAccountPicture: const CircleAvatar(child: Icon(Icons.verified_user,size: 60,),),
            accountEmail: const Text('FedEcommerce', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),) ,
          ),
          ListTile(
            leading: const Icon(Icons.login),title: const Text('Login'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
              },
            enabled: !state.isLogin(),
          ),
          ListTile(leading: const Icon(Icons.select_all_outlined), title: const Text('Product List'),onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListPage()));
            }
          ),
          ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'),onTap: () {
            state.logout();
            setState(() {
              _key = UniqueKey();
              });
            },
            enabled: state.isLogin(),
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
