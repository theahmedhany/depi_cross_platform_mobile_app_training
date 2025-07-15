/*

Define a Book class with the following properties:
  title (String)
  author (String)
  year (int)
  rating (double?) → nullable
  Add a constructor
  Add a method displayInfo() to print the book details
  Practice null safety with the rating property

*/
void main() {
  Book book = Book("Clean Code", "Robert C. Martin", 2008, null);
  book.displayInfo();
}

class Book {
  String title;
  String author;
  int year;
  double? rating;

  Book(this.title, this.author, this.year, this.rating);

  void displayInfo() {
    print("Title: $title");
    print("Author: $author");
    print("Year: $year");
    print("Rating: ${rating ?? 'Not rated'}");
  }
}
