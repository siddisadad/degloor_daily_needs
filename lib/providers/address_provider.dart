import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<Address> _addresses = [
    Address(
      id: '1',
      label: 'Home',
      fullAddress: 'House No. 42, Main Road, Near Bus Stand, Degloor, Maharashtra 431717',
    ),
    Address(
      id: '2',
      label: 'Work',
      fullAddress: 'Office 101, City Center, Degloor, Maharashtra 431717',
    ),
  ];

  int _selectedIndex = 0;

  AddressProvider() {
    _loadFromPrefs();
  }

  List<Address> get addresses => List.unmodifiable(_addresses);
  Address get selectedAddress => _addresses[_selectedIndex];
  int get selectedIndex => _selectedIndex;

  void selectAddress(int index) {
    if (index >= 0 && index < _addresses.length) {
      _selectedIndex = index;
      notifyListeners();
      _saveToPrefs();
    }
  }

  void addAddress(Address address) {
    _addresses.add(address);
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_address_index', _selectedIndex);
    final String encoded = jsonEncode(_addresses.map((a) => a.toJson()).toList());
    await prefs.setString('saved_addresses', encoded);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedIndex = prefs.getInt('selected_address_index') ?? 0;
    final String? encoded = prefs.getString('saved_addresses');
    if (encoded != null) {
      final List<dynamic> decoded = jsonDecode(encoded);
      _addresses = decoded.map((a) => Address.fromJson(a)).toList();
    }
    notifyListeners();
  }
}
