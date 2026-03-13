void main() {
  zadanie(1);
  print(formatName('Иван', 'Иванов'));
  print(formatName('Иван', 'Иванов', otchestvo: 'Иванович'));

  zadanie(2);
  print('5 + 3 = ${calculate(5, 3, '+')}');
  print('10 - 4 = ${calculate(10, 4, '-')}');
  print('6 * 7 = ${calculate(6, 7, '*')}');
  print('20 / 4 = ${calculate(20, 4, '/')}');
  print('10 / 0 = ${calculate(10, 0, '/')}');

  zadanie(3);
  countSigns([1, -5, 0, 10, -2, 0, 3, -1]);

  zadanie(4);
  List<int> list = [1, 2, 3, 4, 5];
  print('Исходный: $list');
  print('Квадрат: ${transformList(list, (x) => x * x)}');
  print('Умножить на 2: ${transformList(list, (x) => x * 2)}');

  zadanie(5);
  print('Сумма цифр 123: ${sumDigits(123)}');
  print('Сумма цифр 99: ${sumDigits(99)}');
  print('Сумма цифр 5: ${sumDigits(5)}');
}

void zadanie(int num) {
  print("\n" + "-" * 10 + ' Задача $num ' + "-" * 10);
}

String formatName(String name, String familname, {String? otchestvo}) {
  if (otchestvo != null && otchestvo.isNotEmpty) {
    return '$familname $name $otchestvo';
  }
  return '$familname $name';
}

String? calculate(double a, double b, String operation) {
  if (operation == '/' && b == 0) return null;

  switch (operation) {
    case '+':
      return (a + b).toString();
    case '-':
      return (a - b).toString();
    case '*':
      return (a * b).toString();
    case '/':
      return (a / b).toString();
    default:
      return 'Неизвестная операция';
  }
}

void countSigns(List<int> numbers) {
  int positive = 0, negative = 0, zero = 0;
  for (var num in numbers) {
    if (num > 0)
      positive++;
    else if (num < 0)
      negative++;
    else
      zero++;
  }
  print('Положительных: $positive  Отрицательных: $negative  Нулевых: $zero');
}

List<int> transformList(List<int> list, int Function(int) transformer) {
  return list.map(transformer).toList();
}

int sumDigits(int n) {
  if (n < 10) return n;
  return (n % 10) + sumDigits(n ~/ 10);
}
