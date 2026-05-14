import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

class ConstructionDatabase {
  final Database _sqlite;

  Database get sqlite => _sqlite;

  ConstructionDatabase(Database db) : _sqlite = db {
    _createTables();
  }

  factory ConstructionDatabase.inApp() {
    final filePath = p.join(Directory.current.path, 'p2.db');
    final db = sqlite3.open(filePath);
    return ConstructionDatabase(db);
  }

  void _createTables() {
    _sqlite.execute('PRAGMA foreign_keys = ON;');

    _sqlite.execute('''
      CREATE TABLE IF NOT EXISTS clients(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        phone TEXT NOT NULL
      )
    ''');

    _sqlite.execute('''
      CREATE TABLE IF NOT EXISTS houses(
        id TEXT PRIMARY KEY,
        address TEXT NOT NULL,
        floors INTEGER NOT NULL,
        area REAL NOT NULL
      )
    ''');

    _sqlite.execute('''
      CREATE TABLE IF NOT EXISTS services(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        price REAL NOT NULL
      )
    ''');

    _sqlite.execute('''
      CREATE TABLE IF NOT EXISTS orders(
        id TEXT PRIMARY KEY,
        date TEXT NOT NULL,
        clientId TEXT NOT NULL,
        houseId TEXT NOT NULL,
        serviceId TEXT NOT NULL,
        FOREIGN KEY (clientId) REFERENCES clients(id) ON DELETE CASCADE,
        FOREIGN KEY (houseId) REFERENCES houses(id) ON DELETE CASCADE,
        FOREIGN KEY (serviceId) REFERENCES services(id) ON DELETE CASCADE
      )
    ''');
  }

  void close() {
    _sqlite.dispose();
  }
}
