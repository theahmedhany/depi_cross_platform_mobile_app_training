void main() {
  var value = 123;

  if (value is! String) {
    print('The variable is NOT a String.');
  } else {
    print('The variable is a String.');
  }
}
