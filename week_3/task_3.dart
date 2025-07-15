/*

Create a class Student with the following:
  String name
  int age
  double marks
  Constructor to initialize the properties
  A method displayDetails() that prints the student details

  In the main() function:
    Create at least 3 Student objects
    Call displayDetails() for each object

*/

void main() {
  Student s1 = Student("Ali", 20, 85.5);
  Student s2 = Student("Sara", 22, 92.0);
  Student s3 = Student("Omar", 19, 76.4);

  s1.displayDetails();
  s2.displayDetails();
  s3.displayDetails();
}

class Student {
  String name;
  int age;
  double marks;

  Student(this.name, this.age, this.marks);

  void displayDetails() {
    print("Name: $name");
    print("Age: $age");
    print("Marks: $marks");
    print("-------------------");
  }
}
