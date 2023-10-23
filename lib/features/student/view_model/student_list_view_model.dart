import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student_management/features/student/models/student.dart';
import 'package:flutter_student_management/features/student/models/student_list.dart';

class StudentListViewModel with ChangeNotifier {
  // Firebase collection reference
  final databaseReference = FirebaseFirestore.instance.collection("university");
  final StudentList _studentList;

  StudentListViewModel(this._studentList) {
    getStudentsData();
  }

  List<Student> get items => _studentList.items;

  Future getStudentsData() async {
    await databaseReference.get().then((value) {
      if (value.docs.isEmpty) {
        _studentList.items = [];
      } else {
        List<Student> tempStudents = [];
        for (var doc in value.docs) {
          print(doc);
          tempStudents.add(Student.fromMap(doc.data()));
        }
        _studentList.items = tempStudents;
      }
      return value;
    });
    notifyListeners();
  }

  Future addStudent(Student student) async {
    await databaseReference.doc((student.id).toString()).set(student.toMap());
    await getStudentsData();
    notifyListeners();
  }

  Future editStudent(int index, Student student) async {
    await databaseReference.doc(student.id.toString()).set(student.toMap());
    await getStudentsData();
    notifyListeners();
  }

  void addItem(Student student) {
    _studentList.items.add(student);
    notifyListeners();
  }

  void editStudentDetails(int index, Student student) {
    _studentList.items[index] = student;
    notifyListeners();
  }
}
