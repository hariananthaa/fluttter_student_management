import 'package:flutter/material.dart';
import 'package:flutter_student_management/features/student/view_model/student_list_view_model.dart';
import 'package:flutter_student_management/features/student/views/student_list_view.dart';
import 'package:flutter_student_management/features/student/models/student_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Initialize the firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize the StudentListViewModel by passing the empty student list.
  final studentListViewModel = StudentListViewModel(StudentList());

  // RunApp function is used to place our widget tree in the screen.
  runApp(
    StudentManagementApp(
      viewModel: studentListViewModel,
    ),
  );
}

class StudentManagementApp extends StatelessWidget {
  const StudentManagementApp({super.key, required this.viewModel});
  final StudentListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    // [ListenableBuilder] is used to build our widget tree according to the changes that listen from the viewmodel.
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        // To implement android specific style, we use [MaterialApp].
        return MaterialApp(
          title: "Student Management App",
          home: HomePage(
            viewModel: viewModel,
          ),
        );
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   String? _username;
//   String? _password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         title: const Text(
//           "Student Management",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               decoration: const InputDecoration(labelText: 'Username'),
//               // validator: MultiValidator([
//               //   RequiredValidator(errorText: 'Username is required'),
//               //   MinLengthValidator(8,
//               //       errorText: 'Username must be at least 8 characters long'),
//               // ]),
//               onSaved: (value) => _username = value,
//             ),
//             TextFormField(
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//               // validator: MultiValidator([
//               //   RequiredValidator(errorText: 'Password is required'),
//               //   MinLengthValidator(8,
//               //       errorText: 'Password must be at least 8 characters long'),
//               // ]),
//               onSaved: (value) => _password = value,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   // Login logic here
//                   print(_username);
//                   print(_password);
//                 }
//               },
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
