import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];
  double _shippingAmount = 0.0;
  double _taxesAmount = 0.0;
  double _discountAmount = 0.0;
  String _discountType = "Amount";

  List<Product> get cartItems => _cartItems;
  // Getter for shippingAmount
  double get shippingAmount => _shippingAmount;

  // Setter for shippingAmount
  set shippingAmount(double value) {
    _shippingAmount = value;
    notifyListeners();
  }

  // Getter for taxesAmount
  double get taxesAmount => _taxesAmount;

  // Setter for taxesAmount
  set taxesAmount(double value) {
    _taxesAmount = value;
    notifyListeners();
  }

  // Getter for discountAmount
  double get discountAmount => _discountAmount;

  // Setter for discountAmount
  set discountAmount(double value) {
    _discountAmount = value;
    notifyListeners();
  }

  // Getter for discountType
  String get discountType => _discountType;

  // Setter for discountType
  set discountType(String value) {
    _discountType = value;
    notifyListeners();
  }

  CartProvider() {
    // Load cart data from shared preferences when the CartProvider is initialized
    loadCartFromPrefs();
  }

  void addToCart(Product product,int quantity) {
    _cartItems.add(
        Product(
            image: product.image,
            title: product.title,
            category: product.category,
            price: product.price,
            discountAmount: product.discountAmount,
            discountPrice: product.discountPrice,
            newArrival: product.newArrival,
            quantity: quantity));
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

  void setQuantity(Product product,int quantity) {
    product.quantity = quantity;
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
      orderAmount += double.parse(double.parse("${product.discountPrice}") > 0? product.discountPrice : product.price ) * product.quantity;
    }
    return orderAmount;
  }

  // Function to calculate total amount
  double calculateTotalAmount() {
    double orderAmount = calculateOrderAmount();
    return orderAmount + _shippingAmount + _taxesAmount - _discountAmount;
  }
}