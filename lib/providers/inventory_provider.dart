import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class InventoryProduct {
  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  int stock;
  bool available;

  InventoryProduct({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.stock,
    this.available = true,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'category': category,
        'price': price,
        'stock': stock,
        'available': available,
      };

  factory InventoryProduct.fromJson(Map<String, dynamic> json) => InventoryProduct(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        category: json['category'],
        price: json['price'].toDouble(),
        stock: json['stock'],
        available: json['available'] ?? true,
      );
}

class InventoryProvider extends ChangeNotifier {
  List<InventoryProduct> _products = [
    InventoryProduct(
      id: '1',
      name: 'Sona Masoori Rice (5kg)',
      imageUrl: 'https://dimg.dreamflow.cloud/v1/image/Sona%20Masoori%20Rice%20(5kg)',
      category: 'Grocery',
      price: 345.0,
      stock: 24,
    ),
    InventoryProduct(
      id: '2',
      name: 'Fresh Alphonso Mangoes',
      imageUrl: 'https://dimg.dreamflow.cloud/v1/image/Fresh%20Alphonso%20Mangoes',
      category: 'Fruits',
      price: 550.0,
      stock: 5,
    ),
    InventoryProduct(
      id: '3',
      name: 'Amul Butter 500g',
      imageUrl: 'https://dimg.dreamflow.cloud/v1/image/Amul%20Butter%20500g',
      category: 'Dairy',
      price: 275.0,
      stock: 18,
    ),
  ];

  InventoryProvider() {
    _loadFromPrefs();
  }

  List<InventoryProduct> get products => List.unmodifiable(_products);

  int get totalItems => _products.length;
  int get lowStockCount => _products.where((p) => p.stock < 10).length;

  void updateStock(String id, int newStock) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index >= 0) {
      _products[index].stock = newStock;
      notifyListeners();
      _saveToPrefs();
    }
  }

  void toggleAvailability(String id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index >= 0) {
      _products[index].available = !_products[index].available;
      notifyListeners();
      _saveToPrefs();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      _products.map((p) => p.toJson()).toList(),
    );
    await prefs.setString('inventory_products', encodedData);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('inventory_products');
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      _products = decodedData.map((p) => InventoryProduct.fromJson(p)).toList();
      notifyListeners();
    }
  }
}
