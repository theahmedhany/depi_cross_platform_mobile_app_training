void main() {
  double width = 5.0;
  double height = 3.0;

  double area = calculateArea(width, height);

  print('The area of the rectangle is $area');
}

double calculateArea(double width, double height) {
  return width * height;
}
