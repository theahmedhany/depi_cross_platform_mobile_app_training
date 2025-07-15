/*

🧩 Task 7: Mixin
  Create a mixin Printer with method printDoc().
  Create a class Document that uses this mixin.
  In main(), call printDoc() from a Document object.

*/

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
