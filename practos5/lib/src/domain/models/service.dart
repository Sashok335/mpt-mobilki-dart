import '../id.dart';

class Service implements Id {
  @override
  final String id;
  final String title;
  final String description;
  final double price;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
      };

  factory Service.fromMap(Map<String, dynamic> map) => Service(
        id: map['id'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        price: _asDouble(map['price']),
      );

  static double _asDouble(Object? v) {
    if (v is double) return v;
    if (v is int) return v.toDouble();
    throw FormatException('Ожидали число', v);
  }

  @override
  String toString() => '$title — $price ₽';
}
