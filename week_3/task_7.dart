/*

🧩 Task 3: Named Constructor
  Create a class User with a named constructor guest() that sets default values.
  Print the default info in main().

*/

class User {
  String name;
  int age;

  User(this.name, this.age);

  User.guest() : name = 'Guest', age = 0;

  void display() {
    print('User: $name, Age: $age');
  }
}

void main() {
  User guest = User.guest();
  guest.display();
}
