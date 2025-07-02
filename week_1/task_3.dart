/*

Write a Dart program to check if a given variable is of type int.

*/

void main() {
  var value = '123';

  if (value is int) {
    print('The variable is of type int.');
  } else {
    print('The variable is NOT of type int.');
  }
}
