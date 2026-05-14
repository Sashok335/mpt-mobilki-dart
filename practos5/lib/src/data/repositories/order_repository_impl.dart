import 'package:dart_project/src/domain/models/order.dart';
import 'package:dart_project/src/domain/interfaces/order_repository.dart';
import 'package:dart_project/src/data/database.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ConstructionDatabase _db;

  OrderRepositoryImpl(this._db);

  @override
  void insertOrder(Order order) {
    _db.sqlite.execute(
      'INSERT OR REPLACE INTO orders (id, date, clientId, houseId, serviceId) VALUES (?, ?, ?, ?, ?)',
      [
        order.id,
        order.date.toIso8601String(),
        order.clientId,
        order.houseId,
        order.serviceId,
      ],
    );
  }

  @override
  List<Order> getAllOrders() {
    final res = _db.sqlite.select('SELECT * FROM orders');
    return res.map((row) => Order.fromMap(row)).toList();
  }

  @override
  Order? getOrder(String id) {
    final res = _db.sqlite.select(
      'SELECT * FROM orders WHERE id = ?',
      [id],
    );
    return res.isNotEmpty ? Order.fromMap(res.first) : null;
  }

  @override
  void updateOrder(Order order) {
    _db.sqlite.execute(
      'UPDATE orders SET date = ?, client_id = ?, house_id = ?, service_id = ? WHERE id = ?',
      [
        order.date.toIso8601String(),
        order.clientId,
        order.houseId,
        order.serviceId,
        order.id,
      ],
    );
  }

  @override
  void deleteOrder(String id) {
    _db.sqlite.execute('DELETE FROM orders WHERE id = ?', [id]);
  }
}
