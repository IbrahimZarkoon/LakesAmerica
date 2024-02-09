import 'package:flutter/cupertino.dart';

import '../Pages/AllProductsPage.dart';

void navigateToAllProductsPage(BuildContext context,String img, String title) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (_) => AllProductsPage(img: img,title: title),
    ),
  );
}