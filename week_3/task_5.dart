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
