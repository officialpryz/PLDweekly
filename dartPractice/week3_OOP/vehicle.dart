abstract class Vehicle {
  void startEngine();  // Abstract method

  void stopEngine();   // Abstract method

  void drive();        // Abstract method
}

class Car extends Vehicle {
  @override
  void startEngine() {
    print("Car engine started");
  }

  @override
  void stopEngine() {
    print("Car engine stopped");
  }

  @override
  void drive() {
    print("Car is driving");
  }
}

class Bike extends Vehicle {
  @override
  void startEngine() {
    print("Bike engine started");
  }

  @override
  void stopEngine() {
    print("Bike engine stopped");
  }

  @override
  void drive() {
    print("Bike is driving");
  }
}

void main() {
  Vehicle car = Car();
  Vehicle bike = Bike();

  car.startEngine();
  car.drive();
  car.stopEngine();

  bike.startEngine();
  bike.drive();
  bike.stopEngine();
}
