import 'package:dart_project/dart_project.dart';

void main() {
  final db = ConstructionDatabase.inApp();
  try {
    runMenu(db);
  } finally {
    db.close();
  }
}
