mixin Printer {
  void printDoc() {
    print('Printing document...');
  }
}

class Document with Printer {}

void main() {
  Document doc = Document();
  doc.printDoc();
}
