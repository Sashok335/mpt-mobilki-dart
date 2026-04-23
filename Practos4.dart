// 1
class Cup {
  double volume;

  Cup(this.volume);

  void drink(double amount) {
    if (amount <= volume) {
      volume -= amount;
    }
  }
}

class Person {
  String name;

  Person(this.name);

  void drinkFromMug(Cup mug, double amount) {
    mug.drink(amount);
  }
}

// 2
class Storage {
  List<String> items = [];

  void addItem(String item) {
    items.add(item);
  }

  void removeItem(String item) {
    items.remove(item);
  }
}

class Wardrobe {
  List<Storage> storages;

  Wardrobe(this.storages);

  void addItem(String item) {
    storages.first.addItem(item);
  }

  void removeItem(String item) {
    storages.first.removeItem(item);
  }
}

// 3
class Plate {
  double weight;

  Plate(this.weight);
}

class Barbell {
  double maxWeight;
  List<Plate> left = [];
  List<Plate> right = [];

  Barbell(this.maxWeight);

  double currentWeight() {
    double sum = 0;
    for (var p in left) sum += p.weight;
    for (var p in right) sum += p.weight;
    return sum;
  }

  void addLeft(Plate p) {
    if (currentWeight() + p.weight <= maxWeight) {
      left.add(p);
    }
  }

  void addRight(Plate p) {
    if (currentWeight() + p.weight <= maxWeight) {
      right.add(p);
    }
  }
}

// 4
class CurrencyConverter {
  double convert(double amount, double rate) {
    return amount * rate;
  }
}

// 5
class Garage<T> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  void remove(T item) {
    items.remove(item);
  }
}

// 6
class NumberBox {
  double value;

  NumberBox(this.value);

  NumberBox operator +(NumberBox other) => NumberBox(value + other.value);
  NumberBox operator -(NumberBox other) => NumberBox(value - other.value);
  NumberBox operator *(NumberBox other) => NumberBox(value * other.value);
  NumberBox operator /(NumberBox other) => NumberBox(value / other.value);
}

// 7
enum CarState { stop, drive, turn }

class Car {
  CarState state = CarState.stop;

  void setState(CarState newState) {
    state = newState;
  }
}

// 8
abstract class Shape {
  double area();
}

class Rectangle extends Shape {
  double width, height;

  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

class Triangle extends Shape {
  double base, height;

  Triangle(this.base, this.height);

  @override
  double area() => 0.5 * base * height;
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}

// 9
class NumberConverter {
  String convert(int number, int toBase) {
    return number.toRadixString(toBase);
  }
}

// 10
class ShapeCollection {
  List<Shape> shapes;

  ShapeCollection(this.shapes);

  Shape getMaxArea() {
    shapes.sort((a, b) => b.area().compareTo(a.area()));
    return shapes.first;
  }
}

// 11
abstract class TableItem {}

class Spoon extends TableItem {}

class Fork extends TableItem {}

class Knife extends TableItem {}

class Table {
  List<TableItem> items = [];

  void addItem(TableItem item) {
    items.add(item);
  }

  void removeItem(TableItem item) {
    items.remove(item);
  }
}

void main() {
  var mug = Cup(200);
  var person = Person("Ivan");
  person.drinkFromMug(mug, 50);

  var wardrobe = Wardrobe([Storage()]);
  wardrobe.addItem("Shirt");

  var barbell = Barbell(100);
  barbell.addLeft(Plate(10));

  var converter = CurrencyConverter();
  print(converter.convert(10, 90));

  var garage = Garage<String>();
  garage.add("Car");

  var a = NumberBox(10);
  var b = NumberBox(5);
  print((a + b).value);

  var car = Car();
  car.setState(CarState.drive);

  var shapes = ShapeCollection([Rectangle(2, 3), Circle(2)]);
  print(shapes.getMaxArea().area());

  var numConv = NumberConverter();
  print(numConv.convert(255, 16));

  var table = Table();
  table.addItem(Spoon());
}
