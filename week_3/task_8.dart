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
