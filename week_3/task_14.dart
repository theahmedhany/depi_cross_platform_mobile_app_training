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
