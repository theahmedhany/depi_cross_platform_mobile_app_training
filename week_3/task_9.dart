class Animal {
  String name;
  Animal(this.name);
}

class Cat extends Animal {
  int age;
  Cat(String name, this.age) : super(name);

  void display() {
    print('Name: $name, Age: $age');
  }
}

void main() {
  Cat cat = Cat('Luna', 3);
  cat.display();
}
