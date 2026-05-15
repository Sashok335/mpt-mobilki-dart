import 'dart:io';

import 'package:dart_project/src/domain/validators/text_validator.dart';
import 'package:dart_project/src/domain/validators/number_validator.dart';

String askString(String label) {
  while (true) {
    stdout.write(label);
    final value = stdin.readLineSync();
    final error = validateRequired(value);
    if (error == null) return value!.trim();
    stderr.writeln(error);
  }
}

double askDouble(String label) {
  while (true) {
    stdout.write(label);
    final value = stdin.readLineSync()?.trim().replaceAll(',', '.') ?? '';
    final parsed = double.tryParse(value);
    final error = validatePositiveNumber(parsed);
    if (error == null) return parsed!;
    stderr.writeln(error);
  }
}

int askInt(String label) {
  while (true) {
    stdout.write(label);
    final value = stdin.readLineSync()?.trim() ?? '';
    final parsed = int.tryParse(value);
    final error = validatePositiveNumber(parsed);
    if (error == null) return parsed!;
    stderr.writeln(error);
  }
}

DateTime askDateTime(String label) {
  while (true) {
    stdout.write(label);
    final value = stdin.readLineSync()?.trim() ?? '';
    try {
      return DateTime.parse(value);
    } catch (_) {
      stderr.writeln('Некорректный формат даты/времени');
    }
  }
}
