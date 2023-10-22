import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class StudentDetailsView extends StatelessWidget {
  const StudentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
