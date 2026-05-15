import '../id.dart';

class Order implements Id {
  @override
  final String id;
  final DateTime date;
  final String clientId;
  final String houseId;
  final String serviceId;

  Order({
    required this.id,
    required this.date,
    required this.clientId,
    required this.houseId,
    required this.serviceId,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date.toIso8601String(),
        "clientId": clientId,
        "houseId": houseId,
        "serviceId": serviceId,
      };

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map["id"] as String,
      date: DateTime.parse(map["date"] as String),
      clientId: map["clientId"] as String,
      houseId: map["houseId"] as String,
      serviceId: map["serviceId"] as String,
    );
  }

  @override
  String toString() => 'Заказ $id от ${date.toLocal()}';
}
