import 'package:flutter/material.dart';
import 'package:flutter_student_management/features/student_list_view_model.dart';
import 'package:flutter_student_management/models/student.dart';
import 'package:flutter_student_management/models/student_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StudentListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = StudentListViewModel(StudentList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Management')),
      body: ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_viewModel.items[index].name));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.addItem(
              Student('Student1', 20, 'Male', 'Computer Science', true));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
