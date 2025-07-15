/*

🧩 Task 2: Constructor Practice
  Create a class Student with a constructor that accepts name and grade.
  Use this to assign values.
  In main(), create and print the student info.

*/

class Student {
  String name;
  int grade;

  Student(this.name, this.grade);

  void display() {
    print('Student: $name, Grade: $grade');
  }
}

void main() {
  Student student = Student('Ahmed', 90);
  student.display();
}
