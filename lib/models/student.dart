/// Represents a student in a school or university.
class Student {
  String name;
  int age;
  String gender;
  String department;

  /// Whether the student is a full-time student.
  bool isFullTime;

  /// Creates a new student.
  Student(this.name, this.age, this.gender, this.department, this.isFullTime);
}
