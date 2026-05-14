import 'package:dart_project/dart_project.dart';
import 'package:test/test.dart';

void main() {
  test('insert and read Client from in-memory SQLite', () {
    final db = ConstructionDatabase.inApp();
    final repo = ClientRepositoryImpl(db);

    repo.insertClient(Client(id: '2', name: 'Тест', phone: '000'));
    final clients = repo.getAllClients();
    expect(clients.length, greaterThan(0));
    expect(clients.any((c) => c.id == '2'), true);

    db.close();
  });

  test('insert and read Order from in-memory SQLite', () {
    final db = ConstructionDatabase.inApp();
    final clientRepo = ClientRepositoryImpl(db);
    final houseRepo = HouseRepositoryImpl(db);
    final serviceRepo = ServiceRepositoryImpl(db);
    final orderRepo = OrderRepositoryImpl(db);

    clientRepo.insertClient(Client(id: 'c1', name: 'Клиент', phone: '111'));
    houseRepo.insertHouse(House(id: 'h1', address: 'Адрес', floors: 1, area: 50));
    serviceRepo.insertService(Service(id: 's1', title: 'Ремонт', description: 'Косметический', price: 5000));

    orderRepo.insertOrder(Order(
      id: 'o1',
      date: DateTime(2026, 5, 14),
      clientId: 'c1',
      houseId: 'h1',
      serviceId: 's1',
    ));

    final orders = orderRepo.getAllOrders();
    expect(orders.length, greaterThan(0));
    expect(orders.any((o) => o.id == 'o1'), true);

    db.close();
  });
}
