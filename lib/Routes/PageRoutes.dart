import 'package:flutter/cupertino.dart';
import 'package:lakesamerica/Models/Product.dart';
import 'package:lakesamerica/Pages/ApplyDiscountPage.dart';
import 'package:lakesamerica/Pages/CartPage.dart';
import 'package:lakesamerica/Pages/ShippingandReturnsPage.dart';
import 'package:lakesamerica/Pages/SignInPage.dart';
import 'package:lakesamerica/Pages/SingleProductPage.dart';

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

void navigateToSingleProductPage(BuildContext context,Product product) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (_) => SingleProductPage(product: product),
    ),
  );
}

void navigateToDiscountPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (_) => ApplyDiscountPage(),
    ),
  );
}

void navigateToShippingReturnsPage(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ShippingPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset.zero).animate(animation),
          child: child,
        );
      },
    ),
  );
}