import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/storage/storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/notifier_chg.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
  }
}