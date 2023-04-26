import 'package:flutter/material.dart';
import 'package:todo/homePage/view/todo_form.dart';

import '../widget/todo_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        title: const Text("TODO APP"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: TodoListView(), // to do listview
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TodoForm(), //navigate to form page
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
