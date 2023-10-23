// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_student_management/features/student/view_model/student_list_view_model.dart';
import 'package:flutter_student_management/features/student/models/student.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:flutter_student_management/helpers/department_list.dart';
import 'package:flutter_student_management/helpers/gender_list.dart';

class DetailsPage extends StatefulWidget {
  // Creating the variables
  final StudentListViewModel viewModel;
  final int? index;

  const DetailsPage({
    Key? key,
    this.index,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // This is the global key to control the form elements.
  final GlobalKey<FormState> _formKey = GlobalKey();

  // Creating the variables to store the student data.
  String? _name;
  int? _age;
  String? _gender;
  String? _department;
  bool _isFullTime = true;

  @override
  void initState() {
    // this initState will call after this class(page) is created is created.
    super.initState();
    if (widget.index != null) {
      // Initialize the values if the index is available.
      // That means user clicked the student item to edit it.
      _name = widget.viewModel.items[widget.index!].name;
      _age = widget.viewModel.items[widget.index!].age;
      _gender = widget.viewModel.items[widget.index!].gender;
      _department = widget.viewModel.items[widget.index!].department;
      _isFullTime = widget.viewModel.items[widget.index!].isFullTime;
    }
  }

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Save the form data
      _formKey.currentState!.save();

      // Print the form data to the console
      print('Name: $_name');
      print('Age: $_age');
      print('Gender: $_gender');
      print('Department: $_department');
      print('Full time: $_isFullTime');

      Student student;

      if (widget.index == null) {
        // Using the length of the students list as id
        // Create a new student
        student = Student(widget.viewModel.items.length, _name!, _age!,
            _gender!, _department!, _isFullTime);

        // Calling the viewmodel to add the student in the firebase
        widget.viewModel.addStudent(student);
      } else {
        // Create a new instance of the student with updated values with same id.
        student = Student(
            widget.index!, _name!, _age!, _gender!, _department!, _isFullTime);

        // Calling the viewmodel to update the student in the firebase
        widget.viewModel.editStudent(widget.index!, student);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.index == null ? 'Add Student' : "Edit Student"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),

                // Avatar section
                widget.index != null
                    ? Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          widget.viewModel.items[widget.index!].name[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      )
                    : const SizedBox(),

                const SizedBox(
                  height: 30,
                ),

                // Name text field
                TextFormField(
                  initialValue: _name,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Name is required'),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Student name',
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                  onSaved: (value) => _name = value,
                ),

                const SizedBox(
                  height: 30,
                ),

                // Age field
                TextFormField(
                  initialValue: widget.index != null
                      ? widget.viewModel.items[widget.index!].age.toString()
                      : null,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Age is required";
                    }
                    try {
                      int value = int.parse(val);
                      if (value < 17 || value > 65) {
                        return "Age must between 17 to 65";
                      }
                    } catch (e) {
                      return "Invalid age";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    // This is the normal border
                    border: OutlineInputBorder(),
                    // This is the error border
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                  onSaved: (value) => _age = int.tryParse(value!),
                ),

                const SizedBox(
                  height: 30,
                ),

                // Gender dropdown
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Gender is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Gender",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  value: _gender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
                  items: genderList,
                ),

                const SizedBox(
                  height: 30,
                ),

                // Department dropdown
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Department is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Department",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade400),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  value: _department,
                  onChanged: (String? newValue) {
                    setState(() {
                      _department = newValue!;
                    });
                  },
                  items: departmentsList,
                ),

                const SizedBox(
                  height: 30,
                ),

                // Full time or not switch
                SwitchListTile(
                  title: const Text('Full time'),
                  value: _isFullTime,
                  onChanged: (value) => setState(() => _isFullTime = value),
                ),

                const SizedBox(
                  height: 30,
                ),

                // Save button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _saveForm,
                    icon: const Icon(Icons.save),
                    label: const Text(
                      'Save',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
