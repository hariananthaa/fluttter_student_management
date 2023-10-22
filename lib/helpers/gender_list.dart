import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get genderList {
  List<DropdownMenuItem<String>> gender = [
    const DropdownMenuItem(
      value: "Male",
      child: Text("Male"),
    ),
    const DropdownMenuItem(
      value: "Female",
      child: Text("Female"),
    ),
    const DropdownMenuItem(
      value: "Transgender",
      child: Text("Transgender"),
    ),
  ];
  return gender;
}
