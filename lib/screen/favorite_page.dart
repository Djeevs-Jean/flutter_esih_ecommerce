import 'package:flutter/material.dart';
import 'package:bankhoo/data.dart';

class FavoritePage extends StatefulWidget {
  static var title;

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
