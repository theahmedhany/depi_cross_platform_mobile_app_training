/*

Write a Dart program using a do-while loop that prints the numbers from 10 down to 1.
Make sure the loop runs at least once, even if the starting number is greater than 10.

*/

void main() {
  int number = 10;

  do {
    print(number);
    number--;
  } while (number >= 1);
}
