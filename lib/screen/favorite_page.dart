import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/storage/storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/notifier_chg.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';
import 'package:flutter_ecommerce/data_program.dart';

class FavoritePage extends StatefulWidget {
  static var title;

  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {


  List listFavorites = DataProgram.listFavorites;

  @override
  Widget build(BuildContext context) {
    MyAppStateNotifier state = context.watch<MyAppStateNotifier>();
    if (state.isLogin()) {
      return ProductListWidget(getProducts: () {
        return Storage.getFavoriteProdcut(state.getUser()['id']);
      });
    }else {
      return ProductListWidget(getProducts: () {
        return Storage.getFavoriteProdcut(-1);
      },);
    }
    /* return listFavorites.isEmpty ? const Center(child: Text("Tu n'as pas d'article favoris"),) :
    ListView.builder(
      itemCount: listFavorites.length,
      itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading: Image.network(
            listFavorites[index].image,
            width: 50,
            height: 50,
          ),
          title: Text(listFavorites[index].title),
          subtitle: Text('\$${listFavorites[index].price}'),
          trailing: IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              // Ajouter le produit au panier ici
            },
          ),
        );
      },
    );
 */  }
}
