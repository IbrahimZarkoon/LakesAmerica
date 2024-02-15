import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];
  double _shippingAmount = 0.0;
  double _taxesAmount = 0.0;
  double _discountAmount = 0.0;

  List<Product> get cartItems => _cartItems;
  double get shippingAmount => _shippingAmount;
  double get taxesAmount => _taxesAmount;
  double get discountAmount => _discountAmount;

  CartProvider() {
    // Load cart data from shared preferences when the CartProvider is initialized
    loadCartFromPrefs();
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    saveCartToPrefs(); // Save cart data to shared preferences
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    saveCartToPrefs(); // Save cart data to shared preferences
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    saveCartToPrefs(); // Save cart data to shared preferences
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
      saveCartToPrefs(); // Save cart data to shared preferences
      notifyListeners();
    }
  }

  Future<void> saveCartToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartData = _cartItems.map((item) => json.encode(item.toJson())).toList();
    await prefs.setStringList('cart', cartData);
  }

  // Function to load cart data from shared preferences
  Future<void> loadCartFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartData = prefs.getStringList('cart');
    if (cartData != null) {
      _cartItems = cartData.map((item) => Product.fromJson(json.decode(item))).toList();
    }
    notifyListeners();
  }

  // Function to calculate order amount
  double calculateOrderAmount() {
    double orderAmount = 0.0;
    for (Product product in _cartItems) {
      orderAmount += double.parse(product.price) * product.quantity;
    }
    return orderAmount;
  }

  // Function to calculate total amount
  double calculateTotalAmount() {
    double orderAmount = calculateOrderAmount();
    return orderAmount + _shippingAmount + _taxesAmount - _discountAmount;
  }
}