import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  double _balance = 1240.50;
  int _referralPoints = 1200;
  double _cashbackEarned = 450.0;

  UserProvider() {
    _loadFromPrefs();
  }

  double get balance => _balance;
  int get referralPoints => _referralPoints;
  double get cashbackEarned => _cashbackEarned;

  void addBalance(double amount) {
    _balance += amount;
    notifyListeners();
    _saveToPrefs();
  }

  void deductBalance(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      notifyListeners();
      _saveToPrefs();
    }
  }

  void addReferralPoints(int points) {
    _referralPoints += points;
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('user_balance', _balance);
    await prefs.setInt('user_referral_points', _referralPoints);
    await prefs.setDouble('user_cashback_earned', _cashbackEarned);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _balance = prefs.getDouble('user_balance') ?? 1240.50;
    _referralPoints = prefs.getInt('user_referral_points') ?? 1200;
    _cashbackEarned = prefs.getDouble('user_cashback_earned') ?? 450.0;
    notifyListeners();
  }
}
