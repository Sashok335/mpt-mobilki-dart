import 'package:dart_project/dart_project.dart';
import 'package:test/test.dart';

void main() {
  test('Client toMap / fromMap', () {
    final client = Client(id: '1', name: 'Иван', phone: '123456');
    final map = client.toMap();
    final restored = Client.fromMap(map);

    expect(restored.id, '1');
    expect(restored.name, 'Иван');
    expect(restored.phone, '123456');
  });

  test('House toMap / fromMap', () {
    final house = House(id: 'h1', address: 'ул. Ленина, 1', floors: 2, area: 150.5);
    final map = house.toMap();
    final restored = House.fromMap(map);

    expect(restored.id, 'h1');
    expect(restored.address, 'ул. Ленина, 1');
    expect(restored.floors, 2);
    expect(restored.area, 150.5);
  });
}
