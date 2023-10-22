import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get departmentsList {
  List<DropdownMenuItem<String>> departments = [
    const DropdownMenuItem(
      value: "Mathematics",
      child: Text("Mathematics"),
    ),
    const DropdownMenuItem(
      value: "Physics",
      child: Text("Physics"),
    ),
    const DropdownMenuItem(
      value: "Chemistry",
      child: Text("Chemistry"),
    ),
    const DropdownMenuItem(
      value: "Computer Science",
      child: Text("Computer Science"),
    ),
  ];
  return departments;
}
