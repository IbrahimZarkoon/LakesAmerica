import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Models/Product.dart';

class WishlistManager {
  static const _wishlistKey = 'wishlistProducts';

  static Future<void> addProductToWishlist(Product product) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> wishlist = prefs.getStringList(_wishlistKey) ?? [];
    final String productJson = json.encode(product.toJson());

    if (!wishlist.contains(productJson)) {
      wishlist.add(productJson);
      await prefs.setStringList(_wishlistKey, wishlist);
    }
  }

  static Future<List<Product>> getWishlistProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> wishlistJson = prefs.getStringList(_wishlistKey) ?? [];

    return wishlistJson.map((productJson) => Product.fromJson(json.decode(productJson))).toList();
  }

  static Future<void> removeProductFromWishlist(Product product) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList(_wishlistKey) ?? [];
    String productJson = json.encode(product.toJson());

    // Remove the product if it exists in the list
    wishlist = wishlist.where((item) => item != productJson).toList();

    // Save the updated list back to the shared preferences
    await prefs.setStringList(_wishlistKey, wishlist);
  }
}