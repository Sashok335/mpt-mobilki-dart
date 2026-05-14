import 'package:dart_project/src/domain/models/service.dart';
import 'package:dart_project/src/domain/interfaces/service_repository.dart';
import 'package:dart_project/src/data/database.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ConstructionDatabase _db;

  ServiceRepositoryImpl(this._db);

  @override
  void insertService(Service service) {
    _db.sqlite.execute(
      'INSERT OR REPLACE INTO services (id, title, description, price) VALUES (?, ?, ?, ?)',
      [service.id, service.title, service.description, service.price],
    );
  }

  @override
  List<Service> getAllServices() {
    final res = _db.sqlite.select('SELECT * FROM services');
    return res.map((row) => Service.fromMap(row)).toList();
  }

  @override
  Service? getService(String id) {
    final res = _db.sqlite.select(
      'SELECT * FROM services WHERE id = ?',
      [id],
    );
    return res.isNotEmpty ? Service.fromMap(res.first) : null;
  }

  @override
  void updateService(Service service) {
    _db.sqlite.execute(
      'UPDATE services SET title = ?, description = ?, price = ? WHERE id = ?',
      [service.title, service.description, service.price, service.id],
    );
  }

  @override
  void deleteService(String id) {
    _db.sqlite.execute('DELETE FROM services WHERE id = ?', [id]);
  }
}
