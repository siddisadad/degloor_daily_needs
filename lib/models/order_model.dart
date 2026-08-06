import 'product_model.dart';

enum OrderStatus { pending, accepted, pickedUp, delivered, cancelled }

class OrderModel {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final String address;
  final String storeName;
  final DateTime timestamp;
  OrderStatus status;

  OrderModel({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.address,
    required this.storeName,
    required this.timestamp,
    this.status = OrderStatus.pending,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'items': items.map((i) => i.toJson()).toList(),
        'totalAmount': totalAmount,
        'address': address,
        'storeName': storeName,
        'timestamp': timestamp.toIso8601String(),
        'status': status.index,
      };

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        items: (json['items'] as List).map((i) => CartItem.fromJson(i)).toList(),
        totalAmount: json['totalAmount'],
        address: json['address'],
        storeName: json['storeName'],
        timestamp: DateTime.parse(json['timestamp']),
        status: OrderStatus.values[json['status']],
      );
}
