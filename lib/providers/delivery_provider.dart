import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:collection/collection.dart';

class OrderRequest {
  final String id;
  final String store;
  final String distance;
  final String items;
  final String payout;
  bool isAccepted;
  bool isRejected;

  OrderRequest({
    required this.id,
    required this.store,
    required this.distance,
    required this.items,
    required this.payout,
    this.isAccepted = false,
    this.isRejected = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'store': store,
        'distance': distance,
        'items': items,
        'payout': payout,
        'isAccepted': isAccepted,
        'isRejected': isRejected,
      };

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
        id: json['id'],
        store: json['store'],
        distance: json['distance'],
        items: json['items'],
        payout: json['payout'],
        isAccepted: json['isAccepted'] ?? false,
        isRejected: json['isRejected'] ?? false,
      );
}

class DeliveryProvider extends ChangeNotifier {
  bool _isOnline = true;
  double _todayEarnings = 425.50;
  int _ordersCompleted = 12;
  double _rating = 4.9;

  List<OrderRequest> _requests = [
    OrderRequest(
      id: '1',
      store: 'Degloor Fresh Mart',
      distance: '0.8 km',
      items: '5 Items',
      payout: '₹35.00',
    ),
    OrderRequest(
      id: '2',
      store: 'City Bakery',
      distance: '2.4 km',
      items: '2 Items',
      payout: '₹55.00',
    ),
  ];

  DeliveryProvider() {
    _loadFromPrefs();
  }

  bool get isOnline => _isOnline;
  double get todayEarnings => _todayEarnings;
  int get ordersCompleted => _ordersCompleted;
  double get rating => _rating;
  List<OrderRequest> get activeRequests =>
      _requests.where((r) => !r.isAccepted && !r.isRejected).toList();
  OrderRequest? get currentDelivery =>
      _requests.firstWhereOrNull((r) => r.isAccepted && !r.isRejected);

  void toggleOnline() {
    _isOnline = !_isOnline;
    notifyListeners();
    _saveToPrefs();
  }

  void acceptOrder(String id) {
    final index = _requests.indexWhere((r) => r.id == id);
    if (index >= 0) {
      _requests[index].isAccepted = true;
      _ordersCompleted += 1;
      // Extract numeric value from payout string like "₹35.00"
      final payoutValue = double.tryParse(_requests[index].payout.replaceAll('₹', '')) ?? 0.0;
      _todayEarnings += payoutValue;
      notifyListeners();
      _saveToPrefs();
    }
  }

  void rejectOrder(String id) {
    final index = _requests.indexWhere((r) => r.id == id);
    if (index >= 0) {
      _requests[index].isRejected = true;
      notifyListeners();
      _saveToPrefs();
    }
  }

  void addRequest(OrderRequest request) {
    _requests.insert(0, request);
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('delivery_online', _isOnline);
    await prefs.setDouble('delivery_earnings', _todayEarnings);
    await prefs.setInt('delivery_orders', _ordersCompleted);
    final String encodedRequests = jsonEncode(_requests.map((r) => r.toJson()).toList());
    await prefs.setString('delivery_requests', encodedRequests);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isOnline = prefs.getBool('delivery_online') ?? true;
    _todayEarnings = prefs.getDouble('delivery_earnings') ?? 425.50;
    _ordersCompleted = prefs.getInt('delivery_orders') ?? 12;
    final String? encodedRequests = prefs.getString('delivery_requests');
    if (encodedRequests != null) {
      final List<dynamic> decoded = jsonDecode(encodedRequests);
      _requests = decoded.map((r) => OrderRequest.fromJson(r)).toList();
    }
    notifyListeners();
  }
}
