import 'package:hive/hive.dart';
import 'package:todo/homePage/model/todo_model.dart';

class DBServices {
  final todoBox = Hive.box('todo');

  Future<void> setTodo(TodoModel todo) async {
    try {
      await todoBox.add(todo);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteTodo(int index) async {
    try {
      await todoBox.deleteAt(index);
    } catch (e) {
      throw e.toString();
    }
  }

  close() {
    Hive.close();
  }
}
