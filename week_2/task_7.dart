/*

You have a list of prices: [10, 20, 30, 40] Use forEach to print the square of each price.

*/

void main() {
  List<int> prices = [10, 20, 30, 40];

  prices.forEach((price) {
    print(price * price);
  });
}
