import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/notifier_chg.dart';
import 'package:flutter_ecommerce/_widget/_widget_product.dart';
import 'package:flutter_ecommerce/storage/storage.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppStateNotifier state = context.watch<MyAppStateNotifier>();
    if (state.isLogin()) {
      return ProductListWidget(getProducts: () {
        return Storage.getListCartsProduct(state.getUser()['id']);
      });
    } else {
      return ProductListWidget(getProducts: () {
        return Storage.getListCartsProduct(-1);
      });
    }
  }
}
