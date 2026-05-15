import '../id.dart';

class House implements Id {
  @override
  final String id;
  final String address;
  final int floors;
  final double area;

  House({
    required this.id,
    required this.address,
    required this.floors,
    required this.area,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'address': address,
        'floors': floors,
        'area': area,
      };

  factory House.fromMap(Map<String, dynamic> map) => House(
        id: map['id'] as String,
        address: map['address'] as String,
        floors: _asInt(map['floors']),
        area: _asDouble(map['area']),
      );

  static double _asDouble(Object? v) {
    if (v is double) return v;
    if (v is int) return v.toDouble();
    throw FormatException('Ожидали число', v);
  }

  static int _asInt(Object? v) {
    if (v is int) return v;
    if (v is num) return v.toInt();
    throw FormatException('Ожидали целое число', v);
  }

  @override
  String toString() => '$address — $floors эт., $area м²';
}
