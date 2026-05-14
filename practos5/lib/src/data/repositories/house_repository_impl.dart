import 'package:dart_project/src/domain/models/house.dart';
import 'package:dart_project/src/domain/interfaces/house_repository.dart';
import 'package:dart_project/src/data/database.dart';

class HouseRepositoryImpl implements HouseRepository {
  final ConstructionDatabase _db;

  HouseRepositoryImpl(this._db);

  @override
  void insertHouse(House house) {
    _db.sqlite.execute(
      'INSERT OR REPLACE INTO houses (id, address, floors, area) VALUES (?, ?, ?, ?)',
      [house.id, house.address, house.floors, house.area],
    );
  }

  @override
  List<House> getAllHouses() {
    final res = _db.sqlite.select('SELECT * FROM houses');
    return res.map((row) => House.fromMap(row)).toList();
  }

  @override
  House? getHouse(String id) {
    final res = _db.sqlite.select(
      'SELECT * FROM houses WHERE id = ?',
      [id],
    );
    return res.isNotEmpty ? House.fromMap(res.first) : null;
  }

  @override
  void updateHouse(House house) {
    _db.sqlite.execute(
      'UPDATE houses SET address = ?, floors = ?, area = ? WHERE id = ?',
      [house.address, house.floors, house.area, house.id],
    );
  }

  @override
  void deleteHouse(String id) {
    _db.sqlite.execute('DELETE FROM houses WHERE id = ?', [id]);
  }
}
