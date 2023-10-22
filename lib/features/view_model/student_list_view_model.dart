import 'package:flutter/material.dart';
import 'package:flutter_student_management/features/student/models/student.dart';
import 'package:flutter_student_management/features/student/models/student_list.dart';

class StudentListViewModel with ChangeNotifier {
  final StudentList _studentList;

  StudentListViewModel(this._studentList);

  List<Student> get items => _studentList.items;

  void addItem(Student student) {
    _studentList.items.add(student);
    notifyListeners();
  }

  void editStudentDetails(int index, Student student) {
    _studentList.items[index] = student;
    notifyListeners();
  }
}
