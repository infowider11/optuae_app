

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../modal/cart_modal.dart';

class Cartmanage {
  static const _cartKey = 'cartItems';
  static List<CartItem> _items = [];
  List<CartItem> get items => _items;
  // Load cart items from shared preferences
  static Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getStringList(_cartKey);

    if (cartData != null) {
      _items = cartData.map((item) => CartItem.fromJson(jsonDecode(item) as Map<String, dynamic>)).toList().cast<CartItem>();
    }
  }

  // Save cart items to shared preferences
  static Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartData = _items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(_cartKey, cartData);
    print('saved ${cartData}');
  }

  // Add an item to the cart
  static void addItem(CartItem item) {
    final existingItemIndex = _items.indexWhere((cartItem) => cartItem.id == item.id);

    if (existingItemIndex != -1) {
      _items[existingItemIndex].qty += item.qty;
    } else {
      _items.add(item);
    }
    saveCartItems();
  }

  // Remove an item from the cart
  static void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    saveCartItems();
  }

  // Update the quantity of an item in the cart
  static void updateQuantity(String itemId, int newQuantity) {
    print('update qty ${itemId}     ${newQuantity}');
    final itemIndex = _items.indexWhere((item) => item.id == itemId);

    if (itemIndex != -1) {
      _items[itemIndex].qty = newQuantity;
      saveCartItems();
    }
  }

  // Calculate the total price of all items in the cart
  static double get totalPrice {
    double total = 0.0;

    for (var item in _items) {
      total += item.price * item.qty;
    }

    return total;
  }

  static int get cartCount{
    int count = 0;
    count = _items.length;
    return count;
  }

  // Clear all items from the cart
  static void clear() {
    _items.clear();
    saveCartItems();
  }
}
