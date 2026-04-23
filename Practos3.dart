import 'dart:io';

void main() {
  stdout.write("Проанализировать сложные эмодзи? (y/n): ");
  String? answer = stdin.readLineSync();

  if (answer != 'y') return;

  stdout.write("Введите строку с эмодзи: ");
  String input = stdin.readLineSync() ?? "";

  // 1. Количество 16-битных единиц (code units)
  int codeUnitsCount = input.codeUnits.length;

  // 2. Количество кодовых точек (runes)
  List<int> runes = input.runes.toList();
  int codePointsCount = runes.length;

  // 3. Количество "реальных" символов (грубо — как руны)
  int realSymbolsCount = runes.length;

  print("16-битных единиц: $codeUnitsCount");
  print("Кодовых точек: $codePointsCount");
  print("Реальных символов: $realSymbolsCount");

  print("Юникоды символов:");
  for (var r in runes) {
    String hex = r.toRadixString(16).toUpperCase().padLeft(6, '0');
    print("U+$hex");
  }
}
