import 'dart:io';

void main() {
  stdout.write('Enter your age: ');
  String? input = stdin.readLineSync();

  if (input != null) {
    int age = int.tryParse(input) ?? -1;

    if (age < 0) {
      print('Invalid age entered.');
    } else {
      if (age > 18) {
        print('Adult');
      } else {
        print('Minor');
      }
    }
  } else {
    print('No input provided.');
  }
}
