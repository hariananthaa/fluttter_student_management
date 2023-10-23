// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Represents a student in a school or university.
class Student {
  int id;
  String name;
  int age;
  String gender;
  String department;

  /// Whether the student is a full-time student.
  bool isFullTime;

  /// Creates a new student.
  Student(this.id, this.name, this.age, this.gender, this.department,
      this.isFullTime);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'department': department,
      'isFullTime': isFullTime,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      map['id'] as int,
      map['name'] as String,
      map['age'] as int,
      map['gender'] as String,
      map['department'] as String,
      map['isFullTime'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
