import 'package:dio/dio.dart';
import 'package:todo/homePage/model/todo_model.dart';

class ApiService {
  static const String baseUrl = "https://todo-api.com"; //mock api
  Future<void> sendTodoList(List<TodoModel> todos) async {
    try {
      final response = await Dio().post('$baseUrl/todo-list', data: todos);
      if (response.statusCode == 200) {
        print('Data Has been Posted');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
