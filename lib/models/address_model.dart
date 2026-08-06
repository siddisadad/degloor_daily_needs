class Address {
  final String id;
  final String label; // e.g., "Home", "Work"
  final String fullAddress;

  Address({
    required this.id,
    required this.label,
    required this.fullAddress,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'fullAddress': fullAddress,
      };

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json['id'],
        label: json['label'],
        fullAddress: json['fullAddress'],
      );
}
