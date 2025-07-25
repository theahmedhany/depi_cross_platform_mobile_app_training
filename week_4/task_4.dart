void main() {
  String input = "abc";

  try {
    int number = int.parse(input);
    print("Parsed number: $number");
  } on FormatException catch (e) {
    print("Invalid number format: ${e.message}");
  }
}
