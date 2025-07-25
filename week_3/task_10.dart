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
