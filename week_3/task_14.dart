/*

🧩 Task 10: Interface with Implements
  Create a class PrinterInterface with a method printInfo().
  Create a class Report that implements it.
  Override the method and call it from main().

*/

class PrinterInterface {
  void printInfo() {}
}

class Report implements PrinterInterface {
  @override
  void printInfo() {
    print('This is a report.');
  }
}

void main() {
  Report report = Report();
  report.printInfo();
}
