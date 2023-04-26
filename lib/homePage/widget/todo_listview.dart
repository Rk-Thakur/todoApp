import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/homePage/model/todo_model.dart';
import 'package:todo/homePage/provider/todo_provider.dart';
import 'package:todo/homePage/widget/info_box.dart';

class TodoListView extends ConsumerWidget {
  TodoListView({Key? key}) : super(key: key);
  final todoBox = Hive.box('todo');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        builder: (context, todo, _) {
          return todoBox.isEmpty
              ? const Center(
                  child: Text("No Data"),
                )
              : ListView.builder(
                  itemCount: todoBox.length,
                  itemBuilder: (context, index) {
                    final todoDetails = todoBox.getAt(index) as TodoModel;
                    return GestureDetector(
                      onTap: () {
                        informationDialog(context, index, todoDetails);
                      },
                      onDoubleTap: () {},
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  ref
                                      .read(todoProvider.notifier)
                                      .deleteData(index);
                                },
                                icon: const Icon(Icons.delete)),
                            tileColor: const Color(0xffFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(todoDetails.title!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  });
        });
  }
}
