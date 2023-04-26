import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/homePage/model/todo_model.dart';
import 'package:todo/homePage/provider/todo_state.dart';
import 'package:todo/homePage/provider/todo_provider.dart';
import 'package:todo/homePage/view/home_screen.dart';

class TodoForm extends ConsumerStatefulWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<TodoForm> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  GlobalKey<FormState> todoForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen<TodoState>(todoProvider, (previous, next) {
      if (next.todostate == TodoStatus.added) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F6FA),
        appBar: AppBar(
          title: const Text('Add Task'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
              key: todoForm,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      return value!.isEmpty ? 'Required' : null;
                    },
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value!.isEmpty ? 'Required' : null;
                    },
                    controller: descriptionController,
                    minLines: 8,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (todoForm.currentState!.validate()) {
                          final todoDetails = TodoModel(
                              title: titleController.text,
                              description: descriptionController.text);
                          ref.read(todoProvider.notifier).setDate(todoDetails);
                        }
                      },
                      child: const Text("Add"))
                ],
              )),
        )),
      ),
    );
  }
}
