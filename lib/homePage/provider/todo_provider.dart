import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/homePage/model/todo_model.dart';
import 'package:todo/homePage/provider/todo_state.dart';
import 'package:todo/services/db_services.dart';

final todoProvider =
    StateNotifierProvider<TodoProvider, TodoState>((ref) => TodoProvider(ref));

class TodoProvider extends StateNotifier<TodoState> {
  TodoProvider(this.ref) : super(TodoState(todostate: TodoStatus.intial));
  final Ref ref;

  Future<void> setDate(TodoModel todoModel) async {
    try {
      state = state.copyWith(todostate: TodoStatus.intial);
      await DBServices().setTodo(todoModel);

      state = state.copyWith(todostate: TodoStatus.added);
    } catch (e) {
      state = state.copyWith(
          todostate: TodoStatus.failure, errormessage: e.toString());
    }
  }

  Future<void> deleteData(int index) async {
    try {
      await DBServices().deleteTodo(index);
      state = state.copyWith(todostate: TodoStatus.deleted);
    } catch (e) {
      state = state.copyWith(
          todostate: TodoStatus.failure, errormessage: e.toString());
    }
  }
}
