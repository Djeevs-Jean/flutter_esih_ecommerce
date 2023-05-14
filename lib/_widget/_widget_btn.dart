import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/storage/storage.dart';

class WidgetBtn extends StatefulWidget {
  final int userId; 
  final int productId; 
  const WidgetBtn({Key? key, required this.userId, required this.productId}) : super(key: key);

  @override
  State<WidgetBtn> createState() => _WidgetBtnState();
}


class _WidgetBtnState extends State<WidgetBtn> {

  late Future<bool> isFavorite;
  late Future<bool> isCart;

  @override
  void initState() {
    // TODO: implement initState
    isFavorite = Storage.isProductInFavorite(widget.userId, widget.productId);
    isCart = Storage.isProductInPanier(widget.userId, widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30;
    return Row(children: [
      FutureBuilder(future:  isCart, builder: (context, result) {
        if (result.hasData) {
          return IconButton(onPressed: () async {
            if (widget.userId!=-1) {
              await Storage.togglePanierInShop(widget.userId, widget.productId);
              setState(() {
                isCart = Storage.isProductInPanier(widget.userId, widget.productId);
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("You must connected to add to shop")));
            }          
          }, 
          icon: result.data! ?  const Icon(Icons.shopping_cart, size: iconSize,) : const Icon(Icons.shopping_cart_outlined, size: iconSize,),
          color: Colors.blue,
          );
        } else if(result.hasError) {
          return Text("${result.error}");
        } else {
          return const CircularProgressIndicator();
        }
      }) ,

      const SizedBox(width: 5,),

      FutureBuilder(future:  isFavorite, builder: (context, result) {
        if (result.hasData) {
          return IconButton(onPressed: () async {
            if (widget.userId!=-1) {
              await Storage.toggleAddInFavortite(widget.userId, widget.productId);
              setState(() {
                isFavorite = Storage.isProductInFavorite(widget.userId, widget.productId);
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("You must connected to add to favorite")));
            }          
          }, 
          icon: result.data! ?  const Icon(Icons.shopping_cart, size: iconSize,) : const Icon(Icons.shopping_cart_outlined, size: iconSize,),
          color: Colors.blue,
          );
        } else if(result.hasError) {
          return Text("${result.error}");
        } else {
          return const CircularProgressIndicator();
        }
      }) ,


    ],);
  }
  
}
