import 'package:flutter/material.dart';
import 'package:todo/homePage/model/todo_model.dart';

Future<dynamic> informationDialog(
    BuildContext context, int index, TodoModel todoModel) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          elevation: 5,
          title: Text(
            todoModel.title!,
            style:
                const TextStyle(fontSize: 20.00, fontWeight: FontWeight.w600),
          ),
          content: SizedBox(
            height: 100,
            width: 25,
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  todoModel.description!,
                  style: const TextStyle(
                      fontSize: 20.00, fontWeight: FontWeight.w600),
                )
              ]),
            ),
          ),
        );
      });
}
