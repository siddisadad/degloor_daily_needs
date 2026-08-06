import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  double _totalRevenue = 42800.0;
  int _totalOrders = 1240;
  int _activePartners = 48;
  int _newCustomers = 156;

  double get totalRevenue => _totalRevenue;
  int get totalOrders => _totalOrders;
  int get activePartners => _activePartners;
  int get newCustomers => _newCustomers;

  // Mock update logic
  void refreshStats() {
    _totalRevenue += 150.0;
    _totalOrders += 1;
    notifyListeners();
  }
}
