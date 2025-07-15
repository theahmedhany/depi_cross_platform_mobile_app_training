/*

🧩 Task 1: Class and Object
  Create a class Book with two properties: title and author.
  Add a method displayInfo() to print both.
  In main(), create an object and call the method.

*/

class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayInfo() {
    print('Title: $title, Author: $author');
  }
}

void main() {
  Book book = Book('1984', 'George Orwell');
  book.displayInfo();
}
