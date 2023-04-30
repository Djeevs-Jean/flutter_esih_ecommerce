import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  List listFavorites = DataApp.listFavorites;

  @override
  Widget build(BuildContext context) {
    return listFavorites.isEmpty ? const Center(child: Text("Tu n'as pas d'article favoris"),) :
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
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List listCart = DataApp.listCart;

    return listCart.isEmpty ? const Center(child: Text("Tu n'as pas d'article dans le panier"),) :
    ListView.builder(
      itemCount: listCart.length,
      itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading: Image.network(
            listCart[index].image,
            width: 50,
            height: 50,
          ),
          title: Text(listCart[index].title),
          subtitle: Text('\$${listCart[index].price}'),
          trailing: IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              // Ajouter le produit au panier ici
            },
          ),
        );
      },
    );
  }
}
