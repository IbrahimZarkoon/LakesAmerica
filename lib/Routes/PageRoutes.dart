import 'package:flutter/cupertino.dart';
import 'package:lakesamerica/Pages/CartPage.dart';
import 'package:lakesamerica/Pages/SignInPage.dart';

import '../Pages/AllProductsPage.dart';

void navigateToAllProductsPage(BuildContext context,String img, String title) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (_) => AllProductsPage(img: img,title: title),
    ),
  );
}

void navigateToCartPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (_) => CartPage(),
    ),
  );
}

void navigateToSignInPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (_) => SignInPage(),
    ),
  );
}