import '../models/order.dart';

abstract class OrderRepository {
  void insertOrder(Order order);
  List<Order> getAllOrders();
  Order? getOrder(String id);
  void updateOrder(Order order);
  void deleteOrder(String id);
}
