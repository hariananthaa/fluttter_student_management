import 'package:flutter/material.dart';
import 'package:flutter_student_management/features/student_list_view.dart';

void main() {
  runApp(const StudentManagementApp());
}

class StudentManagementApp extends StatelessWidget {
  const StudentManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Student Management App",
      home: HomePage(),
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
