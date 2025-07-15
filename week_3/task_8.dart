/*

🧩 Task 4: Inheritance
  Create a base class Vehicle with a method move().
  Create a subclass Car that adds a method honk().
  Create a Car object and call both methods.

*/

class Vehicle {
  void move() {
    print('Vehicle is moving');
  }
}

class Car extends Vehicle {
  void honk() {
    print('Car is honking');
  }
}

void main() {
  Car car = Car();
  car.move();
  car.honk();
}
