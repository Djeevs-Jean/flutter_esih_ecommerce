import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/storage/storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/utils.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    StateNotifier state = context.watch<StateNotifier>();
    if (state.isLogin()) {
      return ProductListWidget(getProducts: () {
        return Storage.getListFavoriteProdcut(state.getUser()['id']);
      });
    }else {
      return ProductListWidget(getProducts: () {
        return Storage.getListFavoriteProdcut(-1);
      },);
    }
  }
}