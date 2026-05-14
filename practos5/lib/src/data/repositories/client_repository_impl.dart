import 'package:dart_project/src/domain/models/client.dart';
import 'package:dart_project/src/domain/interfaces/client_repository.dart';
import 'package:dart_project/src/data/database.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ConstructionDatabase _db;

  ClientRepositoryImpl(this._db);

  @override
  void insertClient(Client client) {
    _db.sqlite.execute(
      'INSERT OR REPLACE INTO clients (id, name, phone) VALUES (?, ?, ?)',
      [client.id, client.name, client.phone],
    );
  }

  @override
  List<Client> getAllClients() {
    final res = _db.sqlite.select('SELECT * FROM clients');
    return res.map((row) => Client.fromMap(row)).toList();
  }

  @override
  Client? getClient(String id) {
    final res = _db.sqlite.select(
      'SELECT * FROM clients WHERE id = ?',
      [id],
    );
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  @override
  void updateClient(Client client) {
    _db.sqlite.execute(
      'UPDATE clients SET name = ?, phone = ? WHERE id = ?',
      [client.name, client.phone, client.id],
    );
  }

  @override
  void deleteClient(String id) {
    _db.sqlite.execute('DELETE FROM clients WHERE id = ?', [id]);
  }
}
