import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> _orders = [];

  OrderProvider() {
    _loadFromPrefs();
  }

  List<OrderModel> get orders => List.unmodifiable(_orders);

  void addOrder(OrderModel order) {
    _orders.insert(0, order);
    notifyListeners();
    _saveToPrefs();
  }

  void updateOrderStatus(String id, OrderStatus status) {
    final index = _orders.indexWhere((o) => o.id == id);
    if (index >= 0) {
      _orders[index].status = status;
      notifyListeners();
      _saveToPrefs();
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(_orders.map((o) => o.toJson()).toList());
    await prefs.setString('user_orders', encoded);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encoded = prefs.getString('user_orders');
    if (encoded != null) {
      final List<dynamic> decoded = jsonDecode(encoded);
      _orders = decoded.map((o) => OrderModel.fromJson(o)).toList();
      notifyListeners();
    }
  }
}
