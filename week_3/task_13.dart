/*

🧩 Task 9: Polymorphism
  Create a class Animal with a method makeSound().
  Create two subclasses Dog and Cat that override this method.
  In main(), use polymorphism to call the overridden method.

*/

class Animal {
  void makeSound() {
    print('Some generic animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow!');
  }
}

void main() {
  List<Animal> animals = [Dog(), Cat()];
  for (var animal in animals) {
    animal.makeSound();
  }
}
