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
