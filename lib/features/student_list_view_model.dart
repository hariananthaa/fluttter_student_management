import 'package:flutter_student_management/models/student.dart';
import 'package:flutter_student_management/models/student_list.dart';

class StudentListViewModel {
  final StudentList _studentList;

  StudentListViewModel(this._studentList);

  List<Student> get items => _studentList.items;

  void addItem(Student student) {
    _studentList.items.add(student);
  }
}
