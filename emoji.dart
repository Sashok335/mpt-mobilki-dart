import 'dart:convert';
import 'package:characters/characters.dart';
import 'dart:io';

void main() {
  List<String> WhiteList = ['да', 'yes', 'y', 'д'];

  print('Хотишь проанализировать эмоджи?:');
  String i = stdin.readLineSync(encoding: utf8)!;
  
  if (WhiteList.contains(i.toLowerCase())) {
    print('Введите эмодзи:');
    String smalik = stdin.readLineSync(encoding: utf8)!;
    analiz(smalik);
    print("Бонус анализ смайлика 👨‍👩‍👧‍👦");
    analiz("👨‍👩‍👧‍👦");
  } else {
    print('Выход.');
  }
}

void analiz(String smalik){
    print('Смайлик: $smalik');
    print('Колич 16-битных единиц: ${smalik.codeUnits.length}');
    print('Колич кодовых точек: ${smalik.runes.length}');
    print('Количе реальных символов: ${smalik.characters.length}');

    print('Юникоды всех символов строки:');
    smalik.runes.map((u) => 'U+${u.toRadixString(16).toUpperCase()}').forEach(print);
  }

