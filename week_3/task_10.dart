/*

🧩 Task 6: Abstract Class
  Create an abstract class Shape with a method area().
  Create a subclass Square that implements area() and calculates area based on side length.
  Print area in main().

*/

abstract class Shape {
  double area();
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double area() => side * side;
}

void main() {
  Square sq = Square(4);
  print('Area: ${sq.area()}');
}
