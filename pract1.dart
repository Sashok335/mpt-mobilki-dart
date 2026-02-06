import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    print(
      "Введите операцию (+, -, *, /, %, ~/, pow, ==, !=, >, <, >=, <=, &&, ||, !):",
    );
    String oper = stdin.readLineSync()!;
    if (oper == "0") {
      print("Работа окончена!");
      break;
    }
    if (oper == "!") {
      print("Введите значение (false,true):");
      var val = stdin.readLineSync()!;
      bool bo = (val == "0" || val == "false") ? false : true;
      bool res = !bo;
      print("Результат: $res");
      return;
    }
    if (oper == "&&" || oper == "||") {
      print("Внимание!!! 0 - будет false, все другое true");
    }
    print(
      "введите число 1 (при вводе неверного начения, оно будет аменено на 1):",
    );
    var num1 = double.tryParse(stdin.readLineSync()!) ?? 1.0;
    print(
      "введите число 2: (при вводе неверного начения, оно будет аменено на 1)",
    );
    var num2 = double.tryParse(stdin.readLineSync()!) ?? 1.0;

    switch (oper) {
      case "+":
        print(num1 + num2);
        break;
      case "-":
        print(num1 - num2);
        break;
      case "*":
        print(num1 * num2);
        break;
      case "/":
        if (num2 == 0) {
          print("Незя делить на 0");
        } else {
          print(num1 / num2);
        }
        break;
      case "%":
        if (num2 == 0) {
          print("Незя делить на 0");
        } else {
          print(num1 % num2);
        }
        break;
      case "~/":
        if (num2 == 0) {
          print("Незя делить на 0");
        } else {
          print(num1 ~/ num2);
        }
        break;
      case "pow":
        print(pow(num1, num2));
        break;
      case "==":
        print(num1 == num2);
        break;
      case "!=":
        print(num1 != num2);
        break;
      case ">":
        print(num1 > num2);
        break;
      case "<":
        print(num1 < num2);
        break;
      case ">=":
        print(num1 >= num2);
        break;
      case "<=":
        print(num1 <= num2);
        break;
      case "&&":
        bool b1 = (num1 != 0);
        bool b2 = (num2 != 0);
        print(b1 && b2);
        break;
      case "||":
        bool b1 = (num1 != 0);
        bool b2 = (num2 != 0);
        print(b1 || b2);
        break;
      default:
        print("Введено неверное значение");
    }
  }
}
