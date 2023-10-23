import 'package:flutter/material.dart';
import 'package:flutter_student_management/features/student/view_model/student_list_view_model.dart';
import 'package:flutter_student_management/features/student/views/student_details_view.dart';

class HomePage extends StatefulWidget {
  final StudentListViewModel viewModel;
  const HomePage({super.key, required this.viewModel});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student list'),
      ),
      body: ListView.builder(
        /// To listout the widgets, we are using [ListView.builder]
        ///
        // Number of items to be listed
        itemCount: widget.viewModel.items.length,

        itemBuilder: (context, index) {
          // [InkWell] is used to make the widget clickable.
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    index: index,
                    viewModel: widget.viewModel,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              child: ListTile(
                leading: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    widget.viewModel.items[index].name[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                title: Text(widget.viewModel.items[index].name),
                subtitle: Text(widget.viewModel.items[index].department),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => DetailsPage(
                viewModel: widget.viewModel,
              ),
            ),
          );
          // _viewModel.addItem(
          //     Student('Student1', 20, 'Male', 'Computer Science', true));
          // setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
