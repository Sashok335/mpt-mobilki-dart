import 'package:dart_project/dart_project.dart';
import 'package:test/test.dart';

void main() {
  test('validateRequired — valid string', () {
    expect(validateRequired('текст'), isNull);
    expect(validateRequired(' a '), isNull);
  });

  test('validateRequired — invalid string', () {
    expect(validateRequired(''), isNotNull);
    expect(validateRequired('   '), isNotNull);
    expect(validateRequired(null), isNotNull);
  });

  test('validatePositiveNumber — valid number', () {
    expect(validatePositiveNumber(1), isNull);
    expect(validatePositiveNumber(100.5), isNull);
  });

  test('validatePositiveNumber — invalid number', () {
    expect(validatePositiveNumber(0), isNotNull);
    expect(validatePositiveNumber(-1), isNotNull);
    expect(validatePositiveNumber(null), isNotNull);
  });

  test('DateTime parse — valid', () {
    expect(DateTime.parse('2026-05-14 14:30'), isA<DateTime>());
    expect(DateTime.parse('2026-05-14T14:30:00'), isA<DateTime>());
  });

  test('DateTime parse — invalid', () {
    expect(() => DateTime.parse('not-a-date'), throwsException);
    expect(() => DateTime.parse(''), throwsException);
  });
}
