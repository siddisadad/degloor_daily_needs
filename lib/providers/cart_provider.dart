import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  CartProvider() {
    _loadFromPrefs();
  }

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount => _items.fold(0.0, (sum, item) => sum + item.total);

  void addItem(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
    _saveToPrefs();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
    _saveToPrefs();
  }

  void decrementItem(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity -= 1;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
      _saveToPrefs();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      _items.map((item) => item.toJson()).toList(),
    );
    await prefs.setString('cart_items', encodedData);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('cart_items');
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      _items = decodedData.map((item) => CartItem.fromJson(item)).toList();
      notifyListeners();
    }
  }
}
